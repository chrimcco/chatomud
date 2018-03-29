require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['possess goblin', { possess: { target: { word: 'goblin' } } }],
      [' pos 3.wolf', { possess: { target: { word: 'wolf', index: '3' } } }],
      [' po 111.demogorgon   ', { possess: { target: { word: 'demogorgon', index: '111' } } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'possess' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end