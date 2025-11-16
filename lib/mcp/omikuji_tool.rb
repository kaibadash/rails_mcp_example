# frozen_string_literal: true

module Mcp
  class OmikujiTool < MCP::Tool
    description 'Draw a random omikuji (Japanese fortune slip)'
    input_schema(
      properties: {
        name: { type: 'string', description: 'Your name' }
      },
      required: ['name']
    )

    FORTUNES = [
      { ja: '大吉', en: 'Great Fortune' },
      { ja: '中吉', en: 'Good Fortune' },
      { ja: '小吉', en: 'Moderate Fortune' },
      { ja: '吉', en: 'Fortune' },
      { ja: '末吉', en: 'Future Blessing' },
      { ja: '末小吉', en: 'Small Future Blessing' },
      { ja: '凶', en: 'Misfortune' },
      { ja: '小凶', en: 'Small Misfortune' },
      { ja: '半凶', en: 'Partial Misfortune' },
      { ja: '大凶', en: 'Great Misfortune' }
    ].freeze

    class << self
      def call(name:, server_context:)
        today = Date.today.to_s
        seed = "#{name}_#{today}".hash.abs
        rng = Random.new(seed)
        fortune = FORTUNES[rng.rand(FORTUNES.size)]

        MCP::Tool::Response.new(
          [
            {
              type: 'text',
              text: "🎌 Omikuji for #{name} 🎌\n\n#{fortune[:ja]} (#{fortune[:en]})"
            }
          ]
        )
      end
    end
  end
end
