require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['draw', { simple_draw: '' }],
      [' dra   ', { simple_draw: '' }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'simple_draw' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end