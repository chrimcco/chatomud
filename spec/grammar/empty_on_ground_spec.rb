require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['empty sack', { empty_on_ground: { target: { word: 'sack' } } }],
      ['  empty backpack', { empty_on_ground: { target: { word: 'backpack' } } }],
      ['empty     2.backpack     ', { empty_on_ground: { target: { word: 'backpack', index: '2' } } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'empty_on_ground' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end