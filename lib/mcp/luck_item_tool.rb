# frozen_string_literal: true

module Mcp
  class LuckItemTool < MCP::Tool
    description 'Get your lucky item for today'
    input_schema(
      properties: {
        name: { type: 'string', description: 'Your name' }
      },
      required: ['name']
    )

    LUCKY_ITEMS = [
      { ja: '赤いハンカチ', en: 'Red handkerchief' },
      { ja: '青いペン', en: 'Blue pen' },
      { ja: '黄色い財布', en: 'Yellow wallet' },
      { ja: '緑の靴下', en: 'Green socks' },
      { ja: '白い帽子', en: 'White hat' },
      { ja: '紫のマフラー', en: 'Purple scarf' },
      { ja: 'ピンクの傘', en: 'Pink umbrella' },
      { ja: 'オレンジのバッグ', en: 'Orange bag' },
      { ja: '銀のアクセサリー', en: 'Silver accessory' },
      { ja: '金のキーホルダー', en: 'Gold keychain' },
      { ja: 'ストライプの靴', en: 'Striped shoes' },
      { ja: '花柄の手帳', en: 'Floral notebook' },
      { ja: '丸いイヤリング', en: 'Round earrings' },
      { ja: '四つ葉のクローバー', en: 'Four-leaf clover' },
      { ja: 'お守り', en: 'Lucky charm' }
    ].freeze

    class << self
      def call(name:, server_context:)
        today = Date.today.to_s
        seed = "#{name}_#{today}".hash.abs
        rng = Random.new(seed)
        item = LUCKY_ITEMS[rng.rand(LUCKY_ITEMS.size)]

        MCP::Tool::Response.new(
          [
            {
              type: 'text',
              text: "✨ Lucky Item for #{name} ✨\n\n#{item[:ja]} (#{item[:en]})"
            }
          ]
        )
      end
    end
  end
end
