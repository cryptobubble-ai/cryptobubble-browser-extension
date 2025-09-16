# Build Instructions for Firefox Extension

## Build Environment Used for Submitted Store Version

### Operating System
- **OS**: macOS 15.6.1 (24G90)
- **Architecture**: Apple M2 Max (ARM64)

### Development Tools
- **Node.js**: v24.5.0
- **npm**: v11.5.1
- **Build System**: Vite v5.4.8
- **Framework**: Svelte 5

## Build Commands
```bash
npm install
make pack-firefox-prod
```

## Build Process
This process:
1. **`npm install`** - Installs exact dependencies from `package-lock.json`
2. **`make pack-firefox-prod`** - Executes the following commands:

   **First, cleans previous build:**
   ```bash
   rm -rf build/firefox-prod
   ```

   **Then builds the extension:**
   ```bash
   BROWSER=firefox ENV=prod vite build
   ```
   This compiles Svelte components and creates the extension in `build/firefox-prod/`

   **Vite automatically copies these files during build:**
   - Firefox-specific `manifest.json` from `deploy/firefox-extension/prod/`
   - Production `config.js` from `deploy/firefox-extension/prod/`
   - Extension icons from `src/icons/`

   **Finally, creates the distribution zip:**
   ```bash
   cd build/firefox-prod && zip -r ../cryptobubble-firefox-prod.zip .
   ```

The submitted `.zip` file was created using this exact process.