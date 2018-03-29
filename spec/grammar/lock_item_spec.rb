require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['lock chest', { lock_item: { target: { word: 'chest' } } }],
      [' lock  2.chest', { lock_item: { target: { word: 'chest', index: '2' } } }],
      ['    lock  56.wardrobe   ', { lock_item: { target: { word: 'wardrobe', index: '56' } } }],
      ['    lock  56.wardrobe.   ', { lock_item: { target: { word: 'wardrobe', index: '56' }, ground: '' } }],
      ['    lock  56.wardrobe   .', { lock_item: { target: { word: 'wardrobe', index: '56' }, ground: '' } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'lock_item' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end