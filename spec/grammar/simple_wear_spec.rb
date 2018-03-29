require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['wear 2.tunic', { simple_wear: { target: { word: 'tunic', index: '2' } } }],
      ['   wea chainm   ', { simple_wear: { target: { word: 'chainm' } } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'simple_wear' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end