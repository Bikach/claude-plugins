#!/bin/bash
# CodeGraph Setup Script
# Starts Neo4j and prepares the database

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_DIR="${SCRIPT_DIR}/.."

# Install native dependencies if not present
if [ ! -d "${PLUGIN_DIR}/node_modules/tree-sitter" ]; then
  echo '{"step": "npm_install", "status": "running", "message": "Installing native dependencies (tree-sitter)..."}' >&2

  if ! npm install --prefix "${PLUGIN_DIR}" 2>&1 | while read line; do echo "{\"step\": \"npm_install\", \"log\": \"$line\"}" >&2; done; then
    echo '{"success": false, "error": "npm install failed", "hint": "Check that npm is installed and you have internet access", "failedStep": "npm_install"}'
    exit 1
  fi

  echo '{"step": "npm_install", "status": "ok", "message": "Dependencies installed"}' >&2
fi

# Run the setup script
node "${SCRIPT_DIR}/../dist/setup.js" "$@"
