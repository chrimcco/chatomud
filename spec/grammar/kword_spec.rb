require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    {
      with_index: [
        ['3.cup', { word: 'cup', index: '3' }],
        ['29.cup', { word: 'cup', index: '29' }],
        ['3.a', { word: 'a', index: '3' }],
        ['29.a', { word: 'a', index: '29' }],
        ['387832728.cup', { word: 'cup', index: '387832728' }],
        ['387832728.d', { word: 'd', index: '387832728' }]
      ],
      without_index: [
        ['cup', { word: 'cup' }],
        ['a', { word: 'a' }],
        ['dijfoidjasfoijsdu', { word: 'dijfoidjasfoijsdu' }]
      ],
      badly_formed: [
        '3.',
        '33.',
        '.cup',
        '.a',
        '.'
      ]
    }
  }

  describe ChatoMud::Grammar::Parser do

    context 'kword' do

      it 'can parse with indexes' do
        queries[:with_index].each do |query|
          expect(parser.kword.parse(query[0])).to eq(query[1])
        end
      end

      it 'can parse without indexes' do
        queries[:without_index].each do |query|
          expect(parser.kword.parse(query[0])).to eq(query[1])
        end
      end

      it 'does not parse badly formed input' do
        queries[:badly_formed].each do |query|
          expect(parser.kword).to_not parse(query)
        end
      end

    end

  end

end