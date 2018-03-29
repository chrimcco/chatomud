require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['empty sack barrel', { empty_into_another: { target: { word:'sack' }, destination: { word: 'barrel' } } }],
      ['  empty backpack 3.bed', { empty_into_another: { target: { word: 'backpack' }, destination: { word: 'bed', index: '3' } } }],
      ['empty     2.backpack     3.bed', { empty_into_another: { target: { word: 'backpack', index: '2' }, destination: { word: 'bed', index: '3' } } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'empty_into_another' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end