# frozen_string_literal: true

module Mcp
  class MessagesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      render(json: mcp_server.handle_json(request.body.read))
    end

    private

    def mcp_server
      @mcp_server ||= MCP::Server.new(
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
    end
  end
end
