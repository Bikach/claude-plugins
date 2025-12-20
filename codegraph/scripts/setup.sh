#!/bin/bash
# CodeGraph Setup Script
# Starts Neo4j and prepares the database

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_DIR="${SCRIPT_DIR}/.."

# Install native dependencies if not present
if [ ! -d "${PLUGIN_DIR}/node_modules/tree-sitter" ]; then
  npm install --prefix "${PLUGIN_DIR}" --silent 2>/dev/null
fi

node "${SCRIPT_DIR}/../dist/setup.js" "$@"
