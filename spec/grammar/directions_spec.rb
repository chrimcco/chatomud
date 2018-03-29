require 'grammar/support'

RSpec.describe ChatoMud::Grammar::Parser do

  let!(:parser) { ChatoMud::Grammar::Parser.new }

  let(:queries) {
    [
      ['n', { direction: { towards: { north: '' } } }],
      ['nort', { direction: { towards: { north: '' } } }],
      ['   n', { direction: { towards: { north: '' } } }],
      ['nort    ', { direction: { towards: { north: '' } } }],
      ['   nort    ', { direction: { towards: { north: '' } } }],

      ['e', { direction: { towards: { east: '' } } }],
      ['eas', { direction: { towards: { east: '' } } }],
      ['    e', { direction: { towards: { east: '' } } }],
      ['eas    ', { direction: { towards: { east: '' } } }],
      ['   eas   ', { direction: { towards: { east: '' } } }],

      ['s', { direction: { towards: { south: '' } } }],
      ['sou', { direction: { towards: { south: '' } } }],
      ['   s', { direction: { towards: { south: '' } } }],
      ['sou    ', { direction: { towards: { south: '' } } }],
      ['    s     ', { direction: { towards: { south: '' } } }],

      ['w', { direction: { towards: { west: '' } } }],
      ['wes', { direction: { towards: { west: '' } } }],
      ['    w', { direction: { towards: { west: '' } } }],
      ['wes       ', { direction: { towards: { west: '' } } }],
      ['    w    ', { direction: { towards: { west: '' } } }],

      ['u', { direction: { towards: { up: '' } } }],
      ['up', { direction: { towards: { up: '' } } }],
      ['    u', { direction: { towards: { up: '' } } }],
      ['up     ', { direction: { towards: { up: '' } } }],
      ['    u  ', { direction: { towards: { up: '' } } }],

      ['d', { direction: { towards: { down: '' } } }],
      ['dow', { direction: { towards: { down: '' } } }],
      ['    d', { direction: { towards: { down: '' } } }],
      ['dow     ', { direction: { towards: { down: '' } } }],
      [' d ', { direction: { towards: { down: '' } } }],

      ['do (bashing *door)', { direction: { towards: { down: '' }, emote: [{ emote_text: 'bashing ' }, { ref: { type: '*', target: { word: 'door' } } }] } }],
      ['down (with a last glance at ~nissah)', { direction: { towards: { down: '' }, emote: [{ emote_text: 'with a last glance at ' }, { ref: { type: '~', target: { word: 'nissah' } } }] } }],
      ['eas (with a last glance at ~nissah and *3.box cautiously)', { direction: { towards: { east: '' }, emote: [{ emote_text: 'with a last glance at ' }, { ref: { type: '~', target: { word: 'nissah' } } }, { spaces: ' '}, { emote_text: 'and ' }, { ref: { type: '*', target: { word: 'box', index: '3' } } }, { spaces: ' '}, { emote_text: 'cautiously' }] } }]
    ]
  }

  describe ChatoMud::Grammar::Parser do

    context 'directions' do

      it 'can parse' do
        queries.each do |query|
          expect(parser.parse(query[0])).to eq(query[1])
        end
      end

    end

  end

end