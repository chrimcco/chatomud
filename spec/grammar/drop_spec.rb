require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['drop beer', { drop: { target: { word: 'beer' } } }],
      ['  drop 3 2.egg', { drop: { target: { word: 'egg', index: '2' }, amount: '3' } }],
      ['   drop    mug   ', { drop: { target: { word: 'mug' } } }],
      ['  drop  33   backpack   ', { drop: { target: { word: 'backpack' }, amount: '33' } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'drop' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end