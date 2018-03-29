require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['hit asinius', { hit: { target: { word: 'asinius' } } }],
      ['   hit 2.wolf', { hit: { target: { word: 'wolf', index: '2' } } }],
      [' hit 33.warg      ', { hit: { target: { word: 'warg', index: '33' } } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'hit' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end