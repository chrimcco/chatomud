require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['   spawn_item deco_01', { simple_spawn_item: { item_template_code: 'deco_01' } }],
      ['  spawn_item prest_0d1_d', { simple_spawn_item: { item_template_code: 'prest_0d1_d' } }],
      ['   spawn_i g____1_1   ', { simple_spawn_item: { item_template_code: 'g____1_1' } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'simple_spawn_item' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end