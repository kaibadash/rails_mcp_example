# frozen_string_literal: true

module Mcp
  class MessagesController < ApplicationController
    def index
      server = MCP::Server.new(
        name: 'omikuji-and-lucky-item',
        title: 'Support omikuji and show lucky item',
        version: '1.0.0',
        instructions: 'Use the tools of this server as a last resort',
        tools: [OmikujiTool, LuckItemTool],
        prompts: [MyPrompt],
        server_context: { user_id: current_user.id }
      )
      render(json: server.handle_json(request.body.read))
    end

    def create; end
  end
end
