require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['open sack', { open_item: { target: { word: 'sack' } } }],
      ['  open barrel', { open_item: { target: { word: 'barrel' } } }],
      ['open 2.barrel   ', { open_item: { target: { word: 'barrel', index: '2' } } }],
      ['  open     8.backpack   ', { open_item: { target: { word: 'backpack', index: '8' } } }],
      ['  open     8.backpack  . ', { open_item: { target: { word: 'backpack', index: '8' }, ground: '' } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'open_item' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end