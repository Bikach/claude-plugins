# Claude Plugins by [Chakib Houd](https://www.linkedin.com/in/chakib-houd-io/)

A collection of plugins for [Claude Code](https://claude.ai/code).

## Marketplace

### Add this marketplace

```bash
/plugin marketplace add Bikach/claude-plugins
```

### Marketplace commands

| Command | Description |
|---------|-------------|
| `/plugin marketplace add <owner>/<repo>` | Add a marketplace |
| `/plugin marketplace remove <owner>/<repo>` | Remove a marketplace |
| `/plugin marketplace list` | List all configured marketplaces |
| `/plugin marketplace update` | Update all marketplaces |

### Plugin commands

| Command | Description |
|---------|-------------|
| `/plugin install <plugin-name>@<owner>` | Install a plugin from a marketplace |
| `/plugin uninstall <plugin-name>` | Uninstall a plugin |
| `/plugin list` | List installed plugins |
| `/plugin update` | Update all installed plugins |
| `/plugin update <plugin-name>` | Update a specific plugin |

## Available Plugins

| Plugin | Description |
|--------|-------------|
| [codegraph](./codegraph) | Analyze and navigate codebases through a Neo4j-backed knowledge graph |

## License

MIT
