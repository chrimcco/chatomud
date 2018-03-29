require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['get flute', { get_ground: { target: { word: 'flute' } } }],
      ['get 3.flute', { get_ground: { target: { word: 'flute', index: '3' } } }],
      ['get 111.flute   ', { get_ground: { target: { word: 'flute', index: '111' } } }],
      ['   get 3 sandwich   ', { get_ground: { amount: '3', target: { word: 'sandwich' } } }],
      ['get   34    21.sandwich   ', { get_ground: { amount: '34', target: { word: 'sandwich', index: '21' } } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'get_ground' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end