require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['skills', { skills: '' }],
      ['   ski', { skills: '' }],
      [' sk      ', { skills: '' }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'skills' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end