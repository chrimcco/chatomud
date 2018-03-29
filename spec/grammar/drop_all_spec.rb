require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['drop *', { drop_all:  '' }],
      ['  drop *', { drop_all: '' }],
      ['   drop    *   ', { drop_all: '' }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'drop_all' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end