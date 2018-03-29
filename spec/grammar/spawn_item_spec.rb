require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['   spawn_item cont_01 out_01', { spawn_item: { item_template_code: 'cont_01', item_outfitter_code: 'out_01' } }],
      ['  spawn_item cont_0d1_d out_01_d', { spawn_item: { item_template_code: 'cont_0d1_d', item_outfitter_code: 'out_01_d' } }],
      ['   spawn_i g____1_1 d_d_d  ', { spawn_item: { item_template_code: 'g____1_1', item_outfitter_code: 'd_d_d' } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'spawn_item' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end