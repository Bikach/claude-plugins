# CodeGraph Plugin for Claude Code

Analyze and navigate codebases through a Neo4j-backed knowledge graph.

## Supported Languages

| Language | Status |
|----------|--------|
| Kotlin | ✅ Available |
| Java | ✅ Available |
| TypeScript | 🔜 Coming soon |

## Prerequisites

- [Docker](https://www.docker.com/products/docker-desktop/) installed and running
- [Claude Code](https://claude.ai/code) CLI

## Installation

### 1. Add the marketplace (once)

```bash
/plugin marketplace add Bikach/claude-plugins
```

### 2. Install the plugin

```bash
/plugin install codegraph@Bikach
```

### Installation Scopes

| Scope | Command | Description |
|-------|---------|-------------|
| **User** (default) | `/plugin install codegraph@Bikach` | Available in all your projects |
| **Project** | `/plugin install codegraph@Bikach --scope project` | Shared with all collaborators |
| **Local** | `/plugin install codegraph@Bikach --scope local` | Only for you in this repo |

## Commands

### `/codegraph:setup`

Starts Neo4j and prepares the database.

```
/codegraph:setup              # Neo4j only
/codegraph:setup kotlin       # Neo4j + Kotlin LSP
/codegraph:setup java         # Neo4j + Java LSP
```

**What it does:**
1. Checks Docker is running
2. Starts the Neo4j container
3. Waits for Neo4j to be ready
4. Creates indexes and constraints
5. Installs tree-sitter native dependencies (required for parsing)
6. Installs Language Server if language specified (optional)

**Result:** Neo4j available at http://localhost:7474

---

### `/codegraph:index`

Indexes a project into the Neo4j graph.

```
/codegraph:index                      # Index current project
/codegraph:index /path/to/project     # Index specific project
/codegraph:index --clear              # Clear database before indexing
/codegraph:index --exclude-tests      # Exclude test files
```

**What it does:**
1. Scans source files (.kt, .java)
2. Parses with tree-sitter
3. Resolves cross-file symbols
4. Writes the graph to Neo4j

---

### `/codegraph:status`

Shows Neo4j status and graph statistics.

```
/codegraph:status
```

**Shows:**
- Neo4j connection status
- Node counts (classes, functions, etc.)
- Relationship counts (CALLS, IMPLEMENTS, etc.)

---

## After Indexing

Once indexed, the following tools are available:

### MCP tools (graph-based)

| Tool | Description |
|------|-------------|
| `search_nodes` | Search by name or pattern |
| `get_callees` | What functions are called? |
| `get_neighbors` | Get dependencies and dependents of a class |
| `get_impact` | Analyze modification impact |
| `find_path` | Find shortest path between two nodes |
| `get_file_symbols` | List all symbols in a file |

### LSP tools (semantic analysis - more accurate)

| Tool | Description |
|------|-------------|
| `LSP incomingCalls` | Who calls this function? |
| `LSP goToImplementation` | Find interface implementations |

---

## Language Server (LSP)

CodeGraph uses Language Servers for accurate code navigation (find callers, find implementations).

### Supported LSP

| Language | LSP Server | Status |
|----------|------------|--------|
| Kotlin | `kotlin-language-server` | ✅ Available |
| Java | `jdtls` | ✅ Available |
| TypeScript | `typescript-language-server` | 🔜 Coming soon |

### Automatic installation

```
/codegraph:setup kotlin
/codegraph:setup java
```

### Manual installation

If you didn't add the option during setup:

| OS | Command |
|----|---------|
| macOS | `brew install <lsp-server-name>` |
| Linux (snap) | `sudo snap install <lsp-server-name> --classic` |
| Linux (SDKMAN) | `sdk install <lsp-server-name>` |
| Windows (Scoop) | `scoop install <lsp-server-name>` |
