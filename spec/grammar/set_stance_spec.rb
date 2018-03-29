require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['set stance frantic', { set_stance: { stance: 'frantic' } }],
      ['   se sta djfijdif', { set_stance: { stance: 'djfijdif' } }],
      [' se   s   frenzy   ', { set_stance: { stance: 'frenzy' } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'set_stance' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end