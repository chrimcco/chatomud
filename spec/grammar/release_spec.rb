require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['release', { release: '' }],
      ['   releas', { release: '' }],
      [' rel      ', { release: '' }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'release' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end