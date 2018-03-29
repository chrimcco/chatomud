require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['look asinius 3.watch', { look_at_on_another: { character: { word: 'asinius' }, target: { word: 'watch', index: '3' } } }],
      ['look 43.asinius breastplate', { look_at_on_another: { character: { word: 'asinius', index: '43' }, target: { word: 'breastplate' } } }],
      ['  look nissah bell', { look_at_on_another: { character: { word: 'nissah' }, target: { word: 'bell' } } }],
      ['   look  halred  666.dagger     ', { look_at_on_another: { character: { word: 'halred' }, target: { word: 'dagger', index: '666' } } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'look_at_on_another' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end