require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['   spawn_npc gob_01  gothakra_01', { spawn_npc: { npc_template_code: 'gob_01', character_outfitter_code: 'gothakra_01' } }],
      ['  spawn_np h_i_witch_01 dd__3', { spawn_npc: { npc_template_code: 'h_i_witch_01', character_outfitter_code: 'dd__3' } }],
      ['   spawn_npc g____1_1  adventurer ', { spawn_npc: { npc_template_code: 'g____1_1', character_outfitter_code: 'adventurer' } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'spawn_npc' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end