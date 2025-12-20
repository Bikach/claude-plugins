#!/usr/bin/env node
/**
 * Sync version across all plugin config files.
 * Reads version from codegraph/package.json and updates:
 * - codegraph/.claude-plugin/plugin.json
 * - .claude-plugin/marketplace.json
 */

const fs = require('fs');
const path = require('path');

const ROOT = path.resolve(__dirname, '..');
const PLUGIN_DIR = path.join(ROOT, 'codegraph');

// Read current version from package.json
const packageJson = JSON.parse(fs.readFileSync(path.join(PLUGIN_DIR, 'package.json'), 'utf-8'));
const version = packageJson.version;

console.log(`Syncing version: ${version}`);

// Update codegraph/.claude-plugin/plugin.json
const pluginJsonPath = path.join(PLUGIN_DIR, '.claude-plugin', 'plugin.json');
const pluginJson = JSON.parse(fs.readFileSync(pluginJsonPath, 'utf-8'));
pluginJson.version = version;
fs.writeFileSync(pluginJsonPath, JSON.stringify(pluginJson, null, 2) + '\n');
console.log(`  ✓ ${path.relative(ROOT, pluginJsonPath)}`);

// Update .claude-plugin/marketplace.json
const marketplacePath = path.join(ROOT, '.claude-plugin', 'marketplace.json');
const marketplace = JSON.parse(fs.readFileSync(marketplacePath, 'utf-8'));
const codegraphPlugin = marketplace.plugins.find(p => p.name === 'codegraph');
if (codegraphPlugin) {
  codegraphPlugin.version = version;
  fs.writeFileSync(marketplacePath, JSON.stringify(marketplace, null, 2) + '\n');
  console.log(`  ✓ ${path.relative(ROOT, marketplacePath)}`);
}

console.log(`\nDone! All files updated to version ${version}`);
