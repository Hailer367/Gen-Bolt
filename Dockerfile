# ---- base stage ----
FROM node:22-bookworm-slim AS base
WORKDIR /app

# Install common tools (git needed for pre-start.cjs, curl for healthchecks)
RUN apt-get update && apt-get install -y --no-install-recommends \
    git curl \
    && rm -rf /var/lib/apt/lists/*

# Enable pnpm
ENV PNPM_HOME="/root/.local/share/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable && corepack prepare pnpm@9.15.9 --activate

# ---- build stage ----
FROM base AS build
WORKDIR /app

# Disable Husky in CI
ENV HUSKY=0
ENV CI=true

# Accept optional build-time Remix public URL
ARG VITE_PUBLIC_APP_URL
ENV VITE_PUBLIC_APP_URL=${VITE_PUBLIC_APP_URL}

# Copy dependency files
COPY package.json pnpm-lock.yaml* ./

# Fetch dependencies (pnpm will cache these)
RUN pnpm fetch

# Copy all source files
COPY . .

# Install all dependencies (skip lockfile check to avoid CI build failures)
RUN pnpm install --offline --no-frozen-lockfile

# Build the Remix app
RUN NODE_OPTIONS=--max-old-space-size=4096 pnpm run build

# Prune dev dependencies for smaller runtime image
RUN pnpm prune --prod --ignore-scripts


# ---- runtime stage ----
FROM base AS runtime
WORKDIR /app

ENV NODE_ENV=production
ENV PORT=3000
ENV HOST=0.0.0.0

# Copy only the build output and required files
COPY --from=build /app/build /app/build
COPY --from=build /app/node_modules /app/node_modules
COPY --from=build /app/package.json /app/package.json

EXPOSE 3000

# Healthcheck (useful for Coolify, Render, or Docker Compose)
HEALTHCHECK --interval=10s --timeout=3s --start-period=5s --retries=5 \
  CMD curl -fsS http://localhost:3000/ || exit 1

# Start the Remix production server
CMD ["pnpm", "start"]


# ---- development stage ----
FROM base AS development
WORKDIR /app

# Copy everything for dev environment
COPY . .

# Install all dependencies (skip lockfile check)
RUN pnpm install --no-frozen-lockfile

# Dev environment variables (API keys, logging, etc.)
ARG GROQ_API_KEY
ARG HuggingFace_API_KEY
ARG OPENAI_API_KEY
ARG ANTHROPIC_API_KEY
ARG OPEN_ROUTER_API_KEY
ARG GOOGLE_GENERATIVE_AI_API_KEY
ARG OLLAMA_API_BASE_URL
ARG XAI_API_KEY
ARG TOGETHER_API_KEY
ARG TOGETHER_API_BASE_URL
ARG VITE_LOG_LEVEL=debug
ARG DEFAULT_NUM_CTX

ENV GROQ_API_KEY=${GROQ_API_KEY} \
    HuggingFace_API_KEY=${HuggingFace_API_KEY} \
    OPENAI_API_KEY=${OPENAI_API_KEY} \
    ANTHROPIC_API_KEY=${ANTHROPIC_API_KEY} \
    OPEN_ROUTER_API_KEY=${OPEN_ROUTER_API_KEY} \
    GOOGLE_GENERATIVE_AI_API_KEY=${GOOGLE_GENERATIVE_AI_API_KEY} \
    OLLAMA_API_BASE_URL=${OLLAMA_API_BASE_URL} \
    XAI_API_KEY=${XAI_API_KEY} \
    TOGETHER_API_KEY=${TOGETHER_API_KEY} \
    TOGETHER_API_BASE_URL=${TOGETHER_API_BASE_URL} \
    VITE_LOG_LEVEL=${VITE_LOG_LEVEL} \
    DEFAULT_NUM_CTX=${DEFAULT_NUM_CTX} \
    RUNNING_IN_DOCKER=true

# Run the Remix development server
CMD ["pnpm", "dev", "--host"]
