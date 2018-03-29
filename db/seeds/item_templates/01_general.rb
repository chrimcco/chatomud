ItemTemplate.create!(
  short_desc: 'a tiny skull-shaped key',
  long_desc: "It's hard to spot a tiny, skull-shaped key on the ground.",
  full_desc: 'A grinning skull adorns the handle of this tiny key. What may it open?',
  kwords: ['tiny', 'skull-shaped', 'key'],
  code: 'key_01'
)

ItemTemplate.create!(
  short_desc: 'a small wooden chest',
  long_desc: 'A small wooden chest has been left here.',
  full_desc: 'A small, beautiful work of art. This chest could hold jewels - it has a lock, too.',
  kwords: ['small', 'wooden', 'chest'],
  code: 'cont_01',
  inventory_template: InventoryTemplate.new(
    lid_template: LidTemplate.new(
      lock_template: LockTemplate.new(
        
      )    
    )
  )
)

ItemTemplate.create!(
  short_desc: 'a shiny diamond',
  long_desc: 'A shiny diamond belongs to noone on the ground.',
  full_desc: 'Multifaceted and pretty.',
  kwords: ['diamond', 'shiny'],
  code: 'prest_01'
)

ItemTemplate.create!(
  short_desc: 'a dirt-encrusted, rusty key',
  long_desc: "A dirt-encrusted key rusts here.",
  full_desc: 'This key looks to not have been seen any use for a long time.',
  kwords: ['dirt-encrusted', 'rusty', 'key', 'rusts'],
  code: 'key_02'
)

ItemTemplate.create!(
  short_desc: 'a leather strap',
  long_desc: 'Here there is a small leather strap.',
  full_desc: 'Could be worn around your wrists or ankles, if you are into that kind of thing.',
  kwords: ['small', 'leather', 'strap'],
  possible_slots: [:lwrist, :rwrist, :lankle, :rankle],
  code: 'deco_01'
)

ItemTemplate.create!(
  short_desc: 'a leather wrist sheath',
  long_desc: 'A leather wrist sheath has been discarded here.',
  full_desc: 'You could hide a small blade in that sheath.',
  kwords: ['leather', 'wrist', 'sheath'],
  possible_slots: [:lwrist, :rwrist],
  is_sheath: true,
  inventory_template: InventoryTemplate.new,
  code: 'sheath_01'
)

ItemTemplate.create!(
  short_desc: 'a tiny jingling bell',
  long_desc: 'A tiny jingling bell makes no sound where it lies forgotten here.',
  full_desc: 'The leather strap it is attached to would allow one to wear it in either wrists or ankles, annoying people when moving around.',
  kwords: ['tiny', 'jingling', 'bell'],
  possible_slots: [:lwrist, :rwrist, :lankle, :rankle],
  code: 'deco_02'
)

ItemTemplate.create!(
  short_desc: 'a wooden flute',
  long_desc: 'A wooden flute lies discarded on the ground.',
  full_desc: 'Fancy playing a few notes?',
  kwords: ['wooden', 'flute'],
  code: 'misc_01'
)

ItemTemplate.create!(
  short_desc: 'a cloth sack',
  long_desc: 'There is a rough cloth sack here',
  full_desc: 'This sack is made of rough cloth, ideal for holding a few things.',
  kwords: ['cloth', 'sack', 'rough'],
  code: 'cont_02',
  inventory_template: InventoryTemplate.new
)

ItemTemplate.create!(
  short_desc: 'a wooden crate',
  long_desc: 'There is wooden crate here.',
  full_desc: 'The crate has some nasty splinters - be careful while manipulating it.',
  kwords: ['wooden', 'crate'],
  code: 'cont_03',
  inventory_template: InventoryTemplate.new
)

ItemTemplate.create!(
  short_desc: 'a ham sandwich',
  long_desc: 'A hitherto delicious ham sandwich gathers dust on the ground.',
  full_desc: 'It is waiting for someone to pick it up and eat it.',
  kwords: ['ham', 'sandwich'],
  code: 'food_01',
  stack: AmountTemplate.new(current: 1, max: 10),
  food:  AmountTemplate.new(current: 4, max: 4)
)

ItemTemplate.create!(
  short_desc: 'a leather waterskin',
  long_desc: 'A leather waterskin lies on the ground.',
  full_desc: 'This waterskin would be ideal for your long treks in the forests.',
  kwords: ['leather', 'waterskin'],
  code: 'water_01',
  drink: AmountTemplate.new(current: 14, max: 16, fluid: :wine)
)

ItemTemplate.create!(
  short_desc: 'a generic corpse',
  long_desc: 'A generic corpse has been left here. Quickly, ask and admin to get rid of it!',
  full_desc: 'You are not supposed to be seeing this.',
  kwords: ['the_generic_corpse'],
  code: 'corpse_01',
  inventory_template: InventoryTemplate.new
)

ItemTemplate.create!(
  short_desc: 'a leather harness',
  long_desc: 'A leather harness lies in a heap here.',
  full_desc: 'Ideal for slinging it over one of the shoulders and carrying a single weapon.',
  kwords: ['leather', 'harness'],
  code: 'harn_01',
  possible_slots: [:lshoulder, :rshoulder],
  is_sheath: true,
  inventory_template: InventoryTemplate.new
)
