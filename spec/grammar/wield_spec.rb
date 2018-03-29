require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['wield spear', { wield: { target: { word: 'spear' } } }],
      [' wield  2.spear ', { wield: { target: { word: 'spear', index: '2' } } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'wield' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end