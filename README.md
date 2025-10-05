# Gen Bolt

[![Gen Bolt: AI-Powered Full-Stack Web Development in the Browser](./public/social_preview_index.jpg)](https://github.com/Hailer367/Gen-Bolt)

Welcome to **Gen Bolt**, a comprehensive AI-powered web development platform based on bolt.diy. Gen Bolt allows you to choose from 19+ different LLM providers for each prompt, giving you unprecedented flexibility in AI-assisted development!

## 🚀 Features

Gen Bolt includes **ALL** the features from the original bolt.diy:

### 🤖 AI Provider Support (19+ Providers)
- **OpenAI** - GPT-4, GPT-3.5 Turbo, and latest models
- **Anthropic** - Claude 3 Opus, Sonnet, and Haiku
- **Google** - Gemini Pro and Ultra models
- **Groq** - Ultra-fast inference
- **xAI** - Grok models
- **DeepSeek** - Advanced coding models
- **Mistral** - European AI models
- **Cohere** - Enterprise-grade models
- **Together AI** - Open source model hosting
- **Perplexity** - Search-augmented AI
- **HuggingFace** - Access to thousands of models
- **Ollama** - Local model execution
- **LM Studio** - Local model management
- **OpenRouter** - Meta routing for multiple providers
- **Moonshot (Kimi)** - Chinese AI models  
- **Hyperbolic** - High-performance inference
- **GitHub Models** - GitHub-hosted AI models
- **Amazon Bedrock** - AWS managed AI services
- **OpenAI-like APIs** - Custom provider support

### 💻 Development Features
- **Web-based IDE** - Full code editor with syntax highlighting
- **Terminal Integration** - Built-in terminal for command execution
- **File Management** - Complete file system operations
- **Live Preview** - Real-time application preview
- **Git Integration** - Version control built-in
- **Project Templates** - Quick project scaffolding

### 🔧 Advanced Capabilities
- **WebContainer API** - Browser-based Node.js runtime
- **Multi-language Support** - JavaScript, TypeScript, Python, HTML, CSS, and more
- **Package Management** - npm, yarn, pnpm support
- **Build Systems** - Vite, Webpack, Parcel integration
- **Database Integration** - Supabase support for data persistence
- **Deployment Ready** - One-click deployment to multiple platforms

### 🖥️ Desktop & Cloud
- **Electron Desktop App** - Native desktop experience
- **Cloud Deployment** - Deploy to Netlify, Vercel, GitHub Pages
- **Docker Support** - Containerized deployment options
- **MCP Integration** - Model Context Protocol support

## 🏗️ Deployment on Render

Gen Bolt is optimized for deployment on **Render** with the following configuration:

### Build Command
```bash
npm install && npm run build
```

### Start Command  
```bash
npm start
```

### Environment Variables
Gen Bolt requires API keys for the AI providers you want to use. Set these in Render's Environment tab:

```bash
# Essential AI Providers
OPENAI_API_KEY=your_openai_api_key_here
ANTHROPIC_API_KEY=your_anthropic_api_key_here
GOOGLE_GENERATIVE_AI_API_KEY=your_google_api_key_here

# Optional Providers (add as needed)
GROQ_API_KEY=your_groq_api_key_here
MISTRAL_API_KEY=your_mistral_api_key_here
COHERE_API_KEY=your_cohere_api_key_here
# ... add other provider keys as needed

# Application Settings
NODE_ENV=production
PORT=10000
```

### Render Service Configuration
1. **Service Type**: Web Service
2. **Build Command**: `npm install --legacy-peer-deps && npm run build`  
3. **Start Command**: `npm start`
4. **Node Version**: 18+ (specified in package.json engines)
5. **Health Check**: Automatic via port binding

**Important Note**: Use `--legacy-peer-deps` flag for npm to resolve peer dependency conflicts between Remix and Wrangler versions.

## 🛠️ Local Development

### Prerequisites
- Node.js 18+ 
- npm, yarn, or pnpm

### Quick Start
```bash
# Clone the repository
git clone https://github.com/Hailer367/Gen-Bolt.git
cd Gen-Bolt

# Install dependencies
npm install

# Copy environment file
cp .env.example .env.local

# Add your API keys to .env.local
# Edit .env.local with your favorite editor

# Start development server
npm run dev
```

The application will be available at `http://localhost:3000`

### Development Scripts
```bash
npm run dev          # Start development server
npm run build        # Build for production  
npm run start        # Start production server
npm run test         # Run tests
npm run lint         # Lint code
npm run typecheck    # TypeScript type checking
```

## 🔑 API Key Configuration

Gen Bolt supports multiple ways to configure API keys:

### Option 1: Environment Variables (.env.local)
Create `.env.local` file in the project root:
```bash
OPENAI_API_KEY=your_key_here
ANTHROPIC_API_KEY=your_key_here
# Add other providers as needed
```

### Option 2: In-App Configuration
1. Start the application
2. Go to Settings → Providers
3. Enable desired providers and enter API keys
4. Keys are stored securely in browser storage

## 🚀 Deployment Options

### Render (Recommended)
1. Fork this repository
2. Connect to Render
3. Set build command: `npm install --legacy-peer-deps && npm run build`
4. Set start command: `npm start`
5. Add environment variables (see list above)
6. Deploy!

**Note**: If you encounter peer dependency conflicts during build, ensure you use the `--legacy-peer-deps` flag with npm install.

### Other Platforms
- **Vercel**: `npm run deploy:vercel`
- **Netlify**: `npm run deploy:netlify`  
- **GitHub Pages**: `npm run deploy:github`
- **Docker**: `docker-compose up`

## 🤝 Contributing

Gen Bolt welcomes contributions! Please see [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines.

### Areas for Contribution
- New AI provider integrations
- UI/UX improvements
- Performance optimizations
- Bug fixes and testing
- Documentation improvements

## 📋 Tech Stack

- **Frontend**: React, TypeScript, Remix
- **Styling**: UnoCSS, Tailwind CSS
- **Build**: Vite, ESBuild
- **AI Integration**: Vercel AI SDK
- **Code Editor**: CodeMirror 6
- **Terminal**: xterm.js
- **Runtime**: WebContainer API
- **Desktop**: Electron
- **Database**: Supabase (optional)

## 🔗 Links

- **GitHub**: [https://github.com/Hailer367/Gen-Bolt](https://github.com/Hailer367/Gen-Bolt)
- **Original Project**: [bolt.diy](https://github.com/stackblitz-labs/bolt.diy)
- **Documentation**: See project wiki and code comments
- **Issues**: [GitHub Issues](https://github.com/Hailer367/Gen-Bolt/issues)

## 📄 License

MIT License - see [LICENSE](./LICENSE) file for details.

## 🙏 Acknowledgments

Gen Bolt is built upon the excellent foundation of [bolt.diy](https://github.com/stackblitz-labs/bolt.diy) by the bolt.diy community. We extend our gratitude to all contributors who made this possible.

---

**Made with ❤️ for the developer community**