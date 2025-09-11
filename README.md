# CryptoBubble Browser Extension

This project builds browser extensions for Chromium-based browsers and Firefox from a single shared codebase.

## Project Structure

```
internal/extensions/
├── src/                           # Shared Svelte source code
│   ├── App.svelte
│   ├── lib/components/
│   ├── popup.html
│   └── icons/
├── deploy/                        # Browser-specific deployment configs
│   ├── chrome-extension/          # Chrome & Chromium-based browsers
│   │   ├── dev/
│   │   │   ├── manifest.json
│   │   │   └── config.js
│   │   └── prod/
│   │       ├── manifest.json
│   │       └── config.js
│   └── firefox-extension/         # Firefox-specific
│       ├── dev/manifest.json
│       └── prod/manifest.json
├── build/                         # Generated extension builds (flat structure)
│   ├── chrome-dev/                # Chrome & Chromium browsers dev build
│   ├── chrome-prod/               # Chrome & Chromium browsers prod build
│   ├── firefox-dev/               # Firefox dev build
│   ├── firefox-prod/              # Firefox prod build
│   ├── *.zip                      # Distribution packages (created by make pack-*)
├── Makefile                       # Build automation and packaging
└── package.json                   # Build scripts and dependencies
```

## Building Extensions

### Using Makefile (Recommended)
```bash
# Build specific extensions
make chrome-dev          # Chrome & Chromium browsers dev
make chrome-prod         # Chrome & Chromium browsers prod
make firefox-dev         # Firefox dev
make firefox-prod        # Firefox prod

# Build multiple extensions
make all-dev             # All dev extensions
make all-prod            # All prod extensions
make all                 # All extensions

# Build and package for distribution
make pack-chrome-dev     # Build and create chrome-dev.zip
make pack-firefox-prod   # Build and create firefox-prod.zip  
make pack-all            # Build and package all extensions

# Development helpers
make preview-chrome      # Start dev server with Chrome config
make preview-firefox     # Start dev server with Firefox config
make clean              # Remove all build files
make help               # Show all available commands
```

### Using NPM Scripts (Alternative)
```bash
npm run build:all           # Build all extensions
npm run build:chrome:dev    # Chrome & Chromium browsers dev
npm run build:firefox:prod  # Firefox prod
# ... etc
```

## Output

Built extensions are placed in `build/` directory with a flat structure:
- `build/chrome-dev/` - Chrome & Chromium browsers development version
- `build/chrome-prod/` - Chrome & Chromium browsers production version  
- `build/firefox-dev/` - Firefox development version
- `build/firefox-prod/` - Firefox production version
- `build/*.zip` - Distribution packages (when using `make pack-*` commands)

Each build directory contains:
- `manifest.json` - Browser and environment-specific manifest
- `popup.html` - Extension popup page
- `assets/` - Compiled CSS and JavaScript
- `config.js` - Environment-specific configuration
- `icons/` - Extension icons (16px, 48px, 128px)

## Browser Differences

### Chromium-based Browsers
- Uses Manifest V3
- Supports environment-specific config.js files
- Standard `host_permissions` format
- Works in Chrome, Edge, Opera, and other Chromium-based browsers
- Submitted to Chrome Web Store

### Firefox
- Uses Manifest V3 with Firefox-specific additions
- Includes `browser_specific_settings.gecko` for Firefox Add-ons store
- Compatible with Firefox 109.0+
- Submitted to Firefox Add-ons store

## Development

```bash
# Install dependencies
npm install

# Start development server (uses shared src/)
npm run dev

# Preview production build
npm run preview
```

The development server serves from the shared `src/` directory and is browser-agnostic.