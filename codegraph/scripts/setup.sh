#!/bin/bash
# CodeGraph Setup Script - Orchestrator
# Starts Neo4j and prepares the database with optional LSP installation

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LANGUAGE="$1"

# Install tree-sitter dependencies
source "${SCRIPT_DIR}/setup/tree-sitter.sh"
install_tree_sitter || exit 1

# Install LSP if language specified
if [ "$LANGUAGE" = "kotlin" ]; then
  source "${SCRIPT_DIR}/setup/lsp/kotlin.sh"
  install_kotlin_lsp || exit 1
fi

# Run the main setup (Neo4j)
node "${SCRIPT_DIR}/../dist/setup.js"
