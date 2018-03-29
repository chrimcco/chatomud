require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['kil asinius', { kill_incomplete: { target: { word: 'asinius' } } }],
      ['   k 2.wolf', { kill_incomplete: { target: { word: 'wolf', index: '2' } } }],
      [' ki 33.warg      ', { kill_incomplete: { target: { word: 'warg', index: '33' } } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'kill_incomplete' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end