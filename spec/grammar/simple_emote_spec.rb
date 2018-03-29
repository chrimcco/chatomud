require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['emote Stepping    in, @    looks first at those gathered at *2.bar, then at ~4.asinius, and finally slumps on *chair.', { simple_emote: { emote: [{ emote_text: 'Stepping    in, ' }, { at: '' }, { spaces: '    '}, { emote_text: 'looks first at those gathered at ' }, { ref: { type: '*', target: { index: '2', word: 'bar' } } }, { emote_text: ', then at '}, { ref: { type: '~', target: { index: '4', word: 'asinius' } } }, { emote_text: ', and finally slumps on ' }, { ref: { type: '*', target: { word: 'chair'} } }, { emote_text: '.' }] } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'simple_emote' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end