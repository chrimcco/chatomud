require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['lock n', { lock_door: { direction: { north: '' } } }],
      ['   lock ea  ', { lock_door: { direction: { east: '' } } }],
      [' lock    dow', { lock_door: { direction: { down: '' } } }],
      ['  lock up', { lock_door: { direction: { up: '' } } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'lock_door' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end