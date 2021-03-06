require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let!(:queries) {
    [
      ['say (waving) hello', { emoted_say: { emote: [{ emote_text: 'waving' }], speech: 'hello' } }],
      ['say (*chair on her way, almost tipping it over when she approaches to greet ~asinius) maaaate!!', { emoted_say: { emote: [{ ref: { type: '*', target: { word: 'chair' } } }, { spaces: ' ' }, { emote_text: 'on her way, almost tipping it over when she approaches to greet ' }, { ref: { type: '~', target: { word: 'asinius' } } }], speech: 'maaaate!!' } }],
      ['say (*chair on her way, almost tipping it over when she approaches to greet ~asinius) maaa()()()ate!!**3.word 322.sick', { emoted_say: { emote: [{ ref: { type: '*', target: { word: 'chair' } } }, { spaces: ' ' }, { emote_text: 'on her way, almost tipping it over when she approaches to greet ' }, { ref: { type: '~', target: { word: 'asinius' } } }], speech: 'maaa()()()ate!!**3.word 322.sick' } }],
      ['say (    waving    *knife    around)     I    am a drunken    sailor!   ', { emoted_say: { emote: [{ spaces: '    '}, { emote_text: 'waving    '}, { ref: { type: '*', target: { word: 'knife'} } }, { spaces: '    ' }, { emote_text: 'around' }], speech: 'I    am a drunken    sailor!   ' } }],
      ['say (waving) hello I am trying to f)=)=fuck this()()() up with bracket)S', { emoted_say: { emote: [{ emote_text: 'waving' }], speech: 'hello I am trying to f)=)=fuck this()()() up with bracket)S' } }],
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'emoted_say' do
      it 'can be parsed' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end
    end

  end

end