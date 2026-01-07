---
description: Index the current project into Neo4j graph
---

# Index Command

Index the current project into Neo4j.

## Action

Execute the following command:

```bash
bash "${CLAUDE_PLUGIN_ROOT}/scripts/index-project.sh" $ARGUMENTS
```

If no arguments provided, use `.` as the default path.

## Options

The user can specify options:
- `/codegraph:index --clear` : Clear database before indexing
- `/codegraph:index --exclude-tests` : Exclude test files
- `/codegraph:index /path/to/project` : Index a specific project

## After indexing

Show the indexing summary and list these available tools:

- search_nodes - Search for nodes (classes, interfaces, functions) by name or pattern
- get_callers - Find all functions that call a specified function
- get_callees - Find all functions called by a specified function
- get_neighbors - Get dependencies and dependents of a class/interface
- get_implementations - Find interface implementations
- get_impact - Analyze impact of modifying a node
- find_path - Find shortest path between two nodes
- get_file_symbols - List all symbols defined in a file
