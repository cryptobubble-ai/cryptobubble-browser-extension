# Build Instructions for Chrome Extension

## Build Environment Used for Submitted Chrome Extension

### Operating System
- **OS**: macOS 15.6.1 (24G90)
- **Architecture**: Apple M2 Max (ARM64)

### Development Tools
- **Node.js**: v24.5.0
- **npm**: v11.5.1
- **Build System**: Vite v5.4.8
- **Framework**: Svelte 5

### Build Commands Used
```bash
npm install
make pack-chrome-prod
```

### Build Process
This process:
1. **`npm install`** - Installs exact dependencies from `package-lock.json`
2. **`make pack-chrome-prod`** - Executes the following commands:

   **First, cleans previous build:**
   ```bash
   rm -rf build/chrome-prod
   ```

   **Then builds the extension:**
   ```bash
   BROWSER=chrome ENV=prod vite build
   ```
   This compiles Svelte components and creates the extension in `build/chrome-prod/`

   **Vite automatically copies these files during build:**
   - Chrome-specific `manifest.json` from `deploy/chrome-extension/prod/`
   - Production `config.js` from `deploy/chrome-extension/prod/`
   - Extension icons from `src/icons/`

   **Finally, creates the distribution zip:**
   ```bash
   cd build/chrome-prod && zip -r ../cryptobubble-chrome-prod.zip .
   ```

The submitted `.zip` file was created using this exact process.