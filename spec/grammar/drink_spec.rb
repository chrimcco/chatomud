require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['drink waterskin', { drink: { target: { word: 'waterskin' } } }],
      [' dri 21.barrel 382', { drink: { target: { word: 'barrel', index: '21' }, amount: '382' } }],
      [' drin    21.cup    382    ', { drink: { target: { word: 'cup', index: '21' }, amount: '382' } }],
      [' drin    21.chop  .   382    ', { drink: { target: { word: 'chop', index: '21' }, amount: '382', ground: '' } }],
      [' drink b 100', { drink: { target: { word: 'b' }, amount: '100' } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'drink' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end