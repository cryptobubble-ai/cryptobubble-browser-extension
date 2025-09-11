EXT_DIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
BUILD_DIR := $(EXT_DIR)/build
PY_PORT ?= 5173

.PHONY: clean chrome-dev chrome-prod firefox-dev firefox-prod all-dev all-prod
.PHONY: pack-chrome-dev pack-chrome-prod pack-firefox-dev pack-firefox-prod pack-all
.PHONY: preview-chrome preview-firefox preview-chrome-prod preview-firefox-prod clean-preview

# Main build targets
chrome-dev: clean-chrome-dev
	cd $(EXT_DIR) && npm run build:chrome:dev

chrome-prod: clean-chrome-prod
	cd $(EXT_DIR) && npm run build:chrome:prod

firefox-dev: clean-firefox-dev
	cd $(EXT_DIR) && npm run build:firefox:dev

firefox-prod: clean-firefox-prod
	cd $(EXT_DIR) && npm run build:firefox:prod

# Convenience targets
all-dev: chrome-dev firefox-dev
all-prod: chrome-prod firefox-prod
all: all-dev all-prod

# Clean specific builds
clean-chrome-dev:
	rm -rf $(BUILD_DIR)/chrome-dev

clean-chrome-prod:
	rm -rf $(BUILD_DIR)/chrome-prod

clean-firefox-dev:
	rm -rf $(BUILD_DIR)/firefox-dev

clean-firefox-prod:
	rm -rf $(BUILD_DIR)/firefox-prod

# Clean all builds
clean:
	rm -rf $(BUILD_DIR)

# Packaging targets
pack-chrome-dev: chrome-dev
	cd $(BUILD_DIR)/chrome-dev && zip -r ../cryptobubble-chrome-dev.zip .

pack-chrome-prod: chrome-prod
	cd $(BUILD_DIR)/chrome-prod && zip -r ../cryptobubble-chrome-prod.zip .

pack-firefox-dev: firefox-dev
	cd $(BUILD_DIR)/firefox-dev && zip -r ../cryptobubble-firefox-dev.zip .

pack-firefox-prod: firefox-prod
	cd $(BUILD_DIR)/firefox-prod && zip -r ../cryptobubble-firefox-prod.zip .

pack-all: pack-chrome-dev pack-chrome-prod pack-firefox-dev pack-firefox-prod

# Preview targets for development
preview-chrome: clean-preview
	cp $(EXT_DIR)/deploy/chrome-extension/dev/config.js $(EXT_DIR)/src/config.js
	cd $(EXT_DIR) && npm run dev

preview-firefox: clean-preview
	cp $(EXT_DIR)/deploy/firefox-extension/dev/config.js $(EXT_DIR)/src/config.js
	cd $(EXT_DIR) && npm run dev

preview-chrome-prod: clean-preview
	cp $(EXT_DIR)/deploy/chrome-extension/prod/config.js $(EXT_DIR)/src/config.js
	cd $(EXT_DIR) && npm run preview

preview-firefox-prod: clean-preview
	cp $(EXT_DIR)/deploy/firefox-extension/prod/config.js $(EXT_DIR)/src/config.js
	cd $(EXT_DIR) && npm run preview

clean-preview:
	rm -f $(EXT_DIR)/src/config.js

# Help target
help:
	@echo "Available targets:"
	@echo "  chrome-dev       - Build Chrome & Chromium dev extension"
	@echo "  chrome-prod      - Build Chrome & Chromium prod extension"
	@echo "  firefox-dev      - Build Firefox dev extension"
	@echo "  firefox-prod     - Build Firefox prod extension"
	@echo "  all-dev          - Build all dev extensions"
	@echo "  all-prod         - Build all prod extensions"
	@echo "  all              - Build all extensions"
	@echo "  pack-chrome-dev  - Build and zip Chrome dev extension"
	@echo "  pack-chrome-prod - Build and zip Chrome prod extension"
	@echo "  pack-firefox-dev - Build and zip Firefox dev extension"
	@echo "  pack-firefox-prod- Build and zip Firefox prod extension"
	@echo "  pack-all         - Build and zip all extensions"
	@echo "  preview-chrome   - Start dev server with Chrome dev config"
	@echo "  preview-firefox  - Start dev server with Firefox dev config"
	@echo "  clean            - Remove all build directories"
	@echo "  help             - Show this help message"