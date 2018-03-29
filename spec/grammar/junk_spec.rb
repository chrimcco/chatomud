require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['junk pouch', { junk: { target: { word: 'pouch' } } }],
      [' junk   2.pouch  ', { junk: { target: { word: 'pouch', index: '2' } } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'junk' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end