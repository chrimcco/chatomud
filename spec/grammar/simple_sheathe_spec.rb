require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['sheath longsword', { simple_sheathe: { target: { word: 'longsword' } } }],
      [' sheath   dagg ', { simple_sheathe: { target: { word: 'dagg' } } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'simple_sheathe' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end