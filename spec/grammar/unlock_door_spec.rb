require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['unlock north', { unlock_door: { direction: { north: '' } } }],
      ['  unlock south', { unlock_door: { direction: { south: '' } } }],
      ['unlo east   ', { unlock_door: { direction: { east: '' } } }],
      ['  unloc     down   ', { unlock_door: { direction: { down: '' } } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'unlock_door' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end