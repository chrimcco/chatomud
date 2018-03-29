require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let!(:queries) {
    [
      ['say I need some strong, dwarven ale!', { simple_say: { speech: 'I need some strong, dwarven ale!' } }],
      ['say        I need some strong, dwarven ale!     ', { simple_say: { speech: 'I need some strong, dwarven ale!     ' } }],
      ['sa here I am *** writing a list ~~~*@!!()#!@())!!', { simple_say: { speech: 'here I am *** writing a list ~~~*@!!()#!@())!!' } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'simple_say' do
      it 'can be parsed' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end
    end

  end

end