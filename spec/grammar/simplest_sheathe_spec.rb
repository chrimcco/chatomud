require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['sheath', { simplest_sheathe: '' }],
      [' sheath ', { simplest_sheathe: '' }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'simplest_sheathe' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end