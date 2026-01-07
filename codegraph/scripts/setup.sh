#!/bin/bash
# CodeGraph Setup Script - Orchestrator
# Starts Neo4j and prepares the database

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install tree-sitter dependencies
source "${SCRIPT_DIR}/setup/tree-sitter.sh"
install_tree_sitter || exit 1

# Run the main setup (Neo4j)
node "${SCRIPT_DIR}/../dist/setup.js"
