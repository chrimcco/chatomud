require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['unlock chest', { unlock_item: { target: { word: 'chest' } } }],
      [' unlo  2.chest', { unlock_item: { target: { word: 'chest', index: '2' } } }],
      ['    unl  56.wardrobe   ', { unlock_item: { target: { word: 'wardrobe', index: '56' } } }],
      ['    unl  56.wardrobe.   ', { unlock_item: { target: { word: 'wardrobe', index: '56' }, ground: '' } }],
      ['    unl  56.wardrobe   .', { unlock_item: { target: { word: 'wardrobe', index: '56' }, ground: '' } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'unlock_item' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end