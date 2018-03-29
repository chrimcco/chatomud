require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['sheath dagger harness', { directed_sheathe: { target: { word: 'dagger' }, sheath: { word: 'harness' } } }],
      ['  sheath   2.dagger  harness ', { directed_sheathe: { target: { word: 'dagger', index: '2' }, sheath: { word: 'harness' } } }],
      ['  sheath   2.longsword 5.harness', { directed_sheathe: { target: { word: 'longsword', index: '2' }, sheath: { word: 'harness', index: '5' } } }],
      ['sheath mace 3.sheath', { directed_sheathe: { target: { word: 'mace' }, sheath: { word: 'sheath', index: '3' } } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'directed_sheathe' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end