require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['draw spear', { draw: { target: { word: 'spear' } } }],
      [' dra  2.spear ', { draw: { target: { word: 'spear', index: '2' } } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'draw' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end