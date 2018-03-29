require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['wea eyepatch reye', { directed_wear: { target: { word: 'eyepatch' }, slot: 'reye' } }],
      ['   wear    22.sack    lshoulder   ', { directed_wear: { target: { word: 'sack', index: '22' }, slot: 'lshoulder' } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'directed_wear' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end