require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['look asinius', { look_at: { target: { word: 'asinius' } } }],
      ['look 43.asinius', { look_at: { target: { word: 'asinius', index: '43' } } }],
      ['  look torch  .  ', { look_at: { target: { word: 'torch' }, ground: '' } }],
      ['   look    666.crate  .     ', { look_at: { target: { word: 'crate', index: '666' }, ground: '' } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'look_at' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end