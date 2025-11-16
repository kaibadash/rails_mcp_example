# frozen_string_literal: true

module Mcp
  class MessagesController < ApplicationController
    def create
      server = MCP::Server.new(
        name: 'japanese-fortune-teller',
        title: 'Japanese Fortune Teller - Omikuji & Lucky Item',
        version: '1.0.0',
        instructions: <<~INSTRUCTIONS,
          This server provides Japanese fortune-telling tools.
          - omikuji_tool: to draw a fortune slip for a person.
          - luck_item_tool: to get today's lucky item for a person.
        INSTRUCTIONS
        tools: [Mcp::OmikujiTool, Mcp::LuckItemTool]
      )
      render(json: server.handle_json(request.body.read))
    end
  end
end
