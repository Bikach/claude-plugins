# Claude Plugins by Chakib Houd

A collection of plugins for [Claude Code](https://claude.ai/code).

## Installation

### 1. Add this marketplace

```bash
/plugin marketplace add Bikach/claude-plugins
```

### 2. Install a plugin

```bash
/plugin install <plugin-name>@Bikach
```

## Available Plugins

| Plugin | Description |
|--------|-------------|
| [codegraph](./codegraph) | Analyze and navigate codebases through a Neo4j-backed knowledge graph |

## Plugin Details

### CodeGraph

Analyze and navigate codebases through a Neo4j-backed knowledge graph.

**Supported Languages:**
- ✅ Kotlin
- 🔜 Java (coming soon)
- 🔜 TypeScript (coming soon)

**Commands:**
- `/codegraph:setup` - Start Neo4j and prepare the database
- `/codegraph:index` - Index a project into the graph
- `/codegraph:status` - Show Neo4j status and statistics

**Install:**
```bash
/plugin install codegraph@Bikach
```

## License

MIT
