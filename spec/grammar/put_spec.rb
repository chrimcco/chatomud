require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['put flute case', { put: { target: { word: 'flute' }, destination: { word: 'case' } } }],
      ['put flute 2.case', { put: { target: { word: 'flute' }, destination: { word: 'case', index: '2' } } }],
      ['put 2.flute 219.case', { put: { target: { word: 'flute', index: '2' }, destination: { word: 'case', index: '219' } } }],
      ['put 2.flute 219.case    .', { put: { target: { word: 'flute', index: '2' }, destination: { word: 'case', index: '219' }, ground: '' } }],
      ['put 2.flute 219.case.   ', { put: { target: { word: 'flute', index: '2' }, destination: { word: 'case', index: '219' }, ground: '' } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'put' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end