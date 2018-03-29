require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['open north', { open_door: { direction: { north: '' } } }],
      ['  open south', { open_door: { direction: { south: '' } } }],
      ['open east   ', { open_door: { direction: { east: '' } } }],
      ['  open     down   ', { open_door: { direction: { down: '' } } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'open_door' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end