require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['close north', { close_door: { direction: { north: '' } } }],
      ['  close south', { close_door: { direction: { south: '' } } }],
      ['close east   ', { close_door: { direction: { east: '' } } }],
      ['  close     down   ', { close_door: { direction: { down: '' } } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'close_door' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end