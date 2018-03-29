require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['eat bread', { eat: { target: { word: 'bread' } } }],
      [' eat 21.bread 382', { eat: { target: { word: 'bread', index: '21' }, amount: '382' } }],
      [' eat    21.bread    382    ', { eat: { target: { word: 'bread', index: '21' }, amount: '382' } }],
      [' eat    21.bread  .   382    ', { eat: { target: { word: 'bread', index: '21' }, amount: '382', ground: '' } }],
      [' eat b 100', { eat: { target: { word: 'b' }, amount: '100' } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'eat' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end