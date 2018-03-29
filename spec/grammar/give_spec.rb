require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['give flute nissah', { give: { target: { word: 'flute' }, receiver: { word: 'nissah' } } }],
      ['give bottle   2.bearded', { give: { target: { word: 'bottle' }, receiver: { word: 'bearded', index: '2' } } }],
      ['  give 2  sandwich  kid ', { give: { target: { word: 'sandwich' }, receiver: { word: 'kid' }, amount: '2' } }],
      ['  give  2  2.sandwich  4.kid ', { give: { target: { word: 'sandwich', index: '2' }, receiver: { word: 'kid', index: '4' }, amount: '2' } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'give' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end