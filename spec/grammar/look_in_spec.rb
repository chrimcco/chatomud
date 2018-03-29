require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['look . crate', { look_in: { target: { word: 'crate' } } }],
      ['look . 43.bin', { look_in: { target: { word: 'bin', index: '43' } } }],
      ['  look  . mailbox    ', { look_in: { target: { word: 'mailbox' } } }],
      ['  look  . mailbox.', { look_in: { target: { word: 'mailbox' }, ground: '' } }],
      ['   look .    666.crate       ', { look_in: { target: { word: 'crate', index: '666' } } }],
      ['   look .    666.crate    .   ', { look_in: { target: { word: 'crate', index: '666' }, ground: '' } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'look_in' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end