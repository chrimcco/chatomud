require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['remove tunic', { remove: { target: { word: 'tunic' } } }],
      ['  rem 2.eyepatch', { remove: { target: { word: 'eyepatch', index: '2' } } }],
      ['   remo chainmail   ', { remove: { target: { word: 'chainmail' } } }],
      ['   remove   backpack   ', { remove: { target: { word: 'backpack' } } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'remove' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end