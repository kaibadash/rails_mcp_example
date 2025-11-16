# rails_mcp_example

A sample project implementing an MCP server with Ruby on Rails.

## Overview

This project provides Japanese fortune-telling tools (omikuji and lucky items) as MCP tools.

### Available Tools

- omikuji_tool: Draw a fortune slip
- luck_item_tool: Get today's lucky item

## Setup

### Start Rails Server

```bash
bundle install
bin/rails s -p 3131
```

### Configure MCP Client

Add the following to your MCP client's (Claude Desktop, Cursor, etc.) `mcp.json`:

```json
{
  "mcpServers": {
    "japanese-fortune-teller": {
      "url": "http://localhost:3131/mcp/messages"
    }
  }
}
```

### Usage Examples

You can make requests from your MCP client like:

```
Use the japanese-fortune-teller MCP Server to tell the fortune for "kaibadash"
```
