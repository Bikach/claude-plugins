#!/bin/bash
# Install tree-sitter native dependencies

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/utils.sh"

PLUGIN_DIR="${SCRIPT_DIR}/../.."

install_tree_sitter() {
  if [ -d "${PLUGIN_DIR}/node_modules/tree-sitter" ]; then
    log_step "tree_sitter" "ok" "tree-sitter already installed"
    return 0
  fi

  log_step "tree_sitter" "running" "Installing native dependencies (tree-sitter)..."

  if ! npm install --prefix "${PLUGIN_DIR}" 2>&1 | while read line; do
    echo "{\"step\": \"npm_install\", \"log\": \"$line\"}" >&2
  done; then
    log_error "npm install failed" "Check that npm is installed and you have internet access"
    return 1
  fi

  log_step "tree_sitter" "ok" "Dependencies installed"
}

# Run if executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  install_tree_sitter
fi
