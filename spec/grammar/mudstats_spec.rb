require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['mudstats', { mudstats: '' }],
      ['   mudsta', { mudstats: '' }],
      [' mud      ', { mudstats: '' }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'mudstats' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end