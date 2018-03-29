require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['kill asinius', { kill: { target: { word: 'asinius' } } }],
      ['   kill 2.wolf', { kill: { target: { word: 'wolf', index: '2' } } }],
      [' kill 33.warg      ', { kill: { target: { word: 'warg', index: '33' } } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'kill' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end