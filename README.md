# Simple App

A Node.js application with Docker support, optimized for cross-platform development (Linux, macOS, Windows) and VS Code.

## 🚀 Quick Start

### Prerequisites

- **Node.js** ≥ 20.x (LTS recommended)
- **npm** ≥ 10.x (comes with Node.js)
- **Docker** ≥ 24.x (for containerized deployment)
- **Git** ≥ 2.40.x

### Local Development

```bash
# Clone the repository
git clone <repository-url>
cd simple-app

# Install dependencies
npm ci

# Start development server
npm run dev

# Run tests
npm test

# Build for production
npm run build

# Start production server
npm start
```

### Docker Deployment

```bash
# Build the Docker image
docker build -t simple-app .

# Run the container
docker run -d \
  --name simple-app \
  -p 3000:3000 \
  --env-file .env \
  simple-app

# View logs
docker logs -f simple-app

# Stop and remove
docker stop simple-app && docker rm simple-app
```

### Docker Compose (Recommended for Production)

```bash
# Start all services
docker compose up -d

# View logs
docker compose logs -f

# Stop services
docker compose down

# Rebuild and restart
docker compose up -d --build
```

## 📁 Project Structure

```
simple-app/
├── .dockerignore          # Docker build exclusions
├── .gitignore             # Git version control exclusions
├── Dockerfile             # Multi-stage Docker build
├── docker-compose.yml     # Docker Compose configuration
├── LICENSE                # CC BY-NC-SA License
├── package.json           # Project metadata & dependencies
├── package-lock.json      # Locked dependency versions
├── README.md              # This file
├── src/                   # Application source code
│   ├── server.ts          # Entry point
│   ├── routes/            # API routes
│   ├── middleware/        # Express middleware
│   ├── services/          # Business logic
│   ├── utils/             # Helper functions
│   └── config/            # Configuration
├── tests/                 # Test files
│   ├── unit/              # Unit tests
│   └── integration/       # Integration tests
└── dist/                  # Compiled output (generated)
```

## 🛠 Available Scripts

| Command | Description |
|---------|-------------|
| `npm run dev` | Start development server with hot reload |
| `npm run build` | Compile TypeScript to JavaScript |
| `npm start` | Run production build |
| `npm test` | Run test suite |
| `npm run test:watch` | Run tests in watch mode |
| `npm run test:coverage` | Generate coverage report |
| `npm run lint` | Run ESLint |
| `npm run lint:fix` | Auto-fix ESLint issues |
| `npm run format` | Format code with Prettier |
| `npm run typecheck` | Run TypeScript type checking |

## 🐳 Docker Details

### Multi-Stage Build

The `Dockerfile` uses a 3-stage build for optimal image size:

1. **Builder** (`node:20-alpine`) - Installs dependencies, compiles TypeScript
2. **Test** (optional) - Runs test suite in isolated environment
3. **Runtime** (`node:20-alpine`) - Copies only production artifacts, runs as non-root user

### Image Size Optimization

- Base image: `node:20-alpine` (~45 MB)
- Final runtime image: ~80-100 MB
- Excludes: dev dependencies, source maps, tests, docs, git history

### Environment Variables

Create a `.env` file from `.env.example`:

```env
NODE_ENV=production
PORT=3000
LOG_LEVEL=info
# Add your configuration here
```

## 🧪 Testing

```bash
# Run all tests
npm test

# Run with coverage
npm run test:coverage

# Watch mode for development
npm run test:watch
```

### Test Structure

- **Unit tests**: `tests/unit/` - Isolated function/class tests
- **Integration tests**: `tests/integration/` - API endpoint tests

## 🔧 VS Code Setup

### Recommended Extensions

The `.vscode/extensions.json` recommends:

- **ESLint** - Linting
- **Prettier** - Code formatting
- **TypeScript Hero** - TypeScript utilities
- **Docker** - Container management
- **GitLens** - Git visualization

### Debug Configurations

`.vscode/launch.json` includes:

- **Launch Program** - Debug the application
- **Attach to Process** - Attach to running Node process
- **Docker: Attach** - Debug inside container
- **Jest: Debug Tests** - Debug test files

### Tasks

`.vscode/tasks.json` provides:

- `npm: build` - Compile TypeScript
- `npm: test` - Run tests
- `npm: lint` - Lint code
- `Docker: Build` - Build Docker image
- `Docker: Run` - Run container

## 📦 Dependency Management

### Production Dependencies

```bash
# Add a production dependency
npm install <package>

# Add a development dependency
npm install -D <package>
```

### Updating Dependencies

```bash
# Check for outdated packages
npm outdated

# Update within semver range
npm update

# Update to latest major versions (use with caution)
npx npm-check-updates -u && npm install
```

## 🔒 Security

### Non-Root Container

The Docker image runs as user `nodejs` (UID 1001) instead of root.

### Secrets Management

- **Never commit** `.env` files (in `.gitignore`)
- Use Docker secrets or environment variables in production
- Rotate secrets regularly

### Dependency Scanning

```bash
# Audit for vulnerabilities
npm audit

# Fix automatically (where possible)
npm audit fix
```

## 📝 License

This project is licensed under **CC BY-NC-SA 4.0** - see the [LICENSE](LICENSE) file for details.

### What this means:

- **BY** - Attribution required
- **NC** - Non-commercial use only
- **SA** - Share alike (derivatives must use same license)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/my-feature`
3. Commit changes: `git commit -am 'Add my feature'`
4. Push to branch: `git push origin feature/my-feature`
5. Submit a Pull Request

### Code Style

- Follow TypeScript best practices
- Run `npm run lint` and `npm run format` before committing
- Write tests for new features
- Update documentation as needed

## 📚 Additional Resources

- [Node.js Documentation](https://nodejs.org/docs/latest/api/)
- [Docker Documentation](https://docs.docker.com/)
- [TypeScript Handbook](https://www.typescriptlang.org/docs/)
- [Express.js Guide](https://expressjs.com/en/guide/routing.html)

---

**Built with ❤️ for cross-platform Node.js development**
