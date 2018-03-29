require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['stop', { stop: '' }],
      ['   st', { stop: '' }],
      [' sto      ', { stop: '' }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'stop' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end