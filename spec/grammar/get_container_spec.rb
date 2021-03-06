require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['get flute sack', { get_container: { target: { word: 'flute' }, source: { word: 'sack' } } }],
      ['get 2.flute 10.sack', { get_container: { target: { word: 'flute', index: '2' }, source: { word: 'sack', index: '10' } } }],
      ['get  5.flute 111.sack', { get_container: { target: { word: 'flute', index: '5' }, source: { word: 'sack', index: '111' } } }],
      ['   get 34 sandwich  45.table ', { get_container: { amount: '34', target: { word: 'sandwich' }, source: { word: 'table', index: '45' } } }],
      ['get   2    21.cookie  88.cupboard  ', { get_container: { amount: '2', target: { word: 'cookie', index: '21' }, source: { word: 'cupboard', index: '88' } } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'get_container' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end