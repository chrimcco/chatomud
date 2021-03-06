require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['close sack', { close_item: { target: { word: 'sack' } } }],
      ['  close barrel', { close_item: { target: { word: 'barrel' } } }],
      ['close 2.barrel   ', { close_item: { target: { word: 'barrel', index: '2' } } }],
      ['  close     8.backpack   ', { close_item: { target: { word: 'backpack', index: '8' } } }],
      ['  close     8.backpack  . ', { close_item: { target: { word: 'backpack', index: '8' }, ground: '' } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'close_item' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end