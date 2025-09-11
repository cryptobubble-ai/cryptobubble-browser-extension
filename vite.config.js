import { defineConfig } from 'vite';
import { svelte } from '@sveltejs/vite-plugin-svelte';
import path from 'node:path';
import fs from 'node:fs';

// Get browser and environment from command line args or default to chrome/dev
const browser = process.env.BROWSER || 'chrome';
const env = process.env.ENV || 'dev';

export default defineConfig({
  // Serve from src in dev so /popup.html works
  root: 'src',
  plugins: [
    svelte(),
    // Plugin to copy manifest and config files after build
    {
      name: 'copy-manifest',
      writeBundle() {
        const manifestSrc = path.resolve(__dirname, `deploy/${browser}-extension/${env}/manifest.json`);
        const configSrc = path.resolve(__dirname, `deploy/${browser}-extension/${env}/config.js`);
        const outDir = path.resolve(__dirname, `build/${browser}-${env}`);
        
        // Ensure output directory exists
        if (!fs.existsSync(outDir)) {
          fs.mkdirSync(outDir, { recursive: true });
        }
        
        // Copy manifest
        if (fs.existsSync(manifestSrc)) {
          fs.copyFileSync(manifestSrc, path.join(outDir, 'manifest.json'));
        }
        
        // Copy config if it exists
        if (fs.existsSync(configSrc)) {
          fs.copyFileSync(configSrc, path.join(outDir, 'config.js'));
        }
        
        // Copy icons directory
        const iconsSrc = path.resolve(__dirname, 'src/icons');
        const iconsDir = path.join(outDir, 'icons');
        if (fs.existsSync(iconsSrc)) {
          if (!fs.existsSync(iconsDir)) {
            fs.mkdirSync(iconsDir, { recursive: true });
          }
          const icons = fs.readdirSync(iconsSrc);
          icons.forEach(icon => {
            fs.copyFileSync(path.join(iconsSrc, icon), path.join(iconsDir, icon));
          });
        }
      }
    }
  ],
  server: {
    port: 5173
  },
  build: {
    // Output to project root build directory (../ because Vite root is 'src')
    outDir: `../build/${browser}-${env}`,
    emptyOutDir: true,
    rollupOptions: {
      input: { popup: path.resolve(__dirname, 'src/popup.html') }
    }
  }
});


