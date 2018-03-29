Item.create!(
  short_desc: 'a tiny skull-shaped key',
  long_desc: "It's hard to spot a tiny, skull-shaped key on the ground.",
  full_desc: 'A grinning skull adorns the handle of this tiny key. What may it open?',
  kwords: ['tiny', 'skull-shaped', 'key'],
  slot: :void,
  containing_inventory: Room.find(1).inventory,
  item_template: ItemTemplate.find_by_code('key_01')
)

Item.create!(
  short_desc: 'a small wooden chest',
  long_desc: 'A small wooden chest has been left here.',
  full_desc: 'A small, beautiful work of art. This chest could hold jewels - it has a lock, too.',
  kwords: ['small', 'wooden', 'chest'],
  slot: :void,
  containing_inventory: Room.find(1).inventory,
  inventory: Inventory.new(
    lid: Lid.new(
      open: false,
      lock: Lock.new(
        locked: true,
        lockers: [Item.find(1)]
      )
    ),
  ),
  item_template: ItemTemplate.find_by_code('cont_01')
)

Item.create!(
  short_desc: 'a shiny diamond',
  long_desc: 'A shiny diamond belongs to noone on the ground.',
  full_desc: 'Multifaceted and pretty.',
  kwords: ['diamond', 'shiny'],
  slot: :void,
  containing_inventory: Item.find(2).inventory,
  item_template: ItemTemplate.find_by_code('prest_01')
)

Item.create!(
  short_desc: 'a dirt-encrusted, rusty key',
  long_desc: "A dirt-encrusted key rusts here.",
  full_desc: 'This key looks to not have been seen any use for a long time.',
  kwords: ['dirt-encrusted', 'rusty', 'key', 'rusts'],
  slot: :void,
  containing_inventory: Room.find(1).inventory,
  lockables: [Door.find(2).lock],
  item_template: ItemTemplate.find_by_code('key_02')
)

Item.create!(
  short_desc: 'a leather strap',
  long_desc: 'Here there is a small leather strap.',
  full_desc: 'Could be worn around your wrists or ankles, if you are into that kind of thing.',
  kwords: ['small', 'leather', 'strap'],
  possible_slots: [:lwrist, :rwrist, :lankle, :rankle],
  slot: :rwrist,
  containing_inventory: Character.find(1).inventory,
  item_template: ItemTemplate.find_by_code('deco_01')
)

Item.create!(
  short_desc: 'a leather wrist sheath',
  long_desc: 'A leather wrist sheath has been discarded here.',
  full_desc: 'You could hide a small blade in that sheath.',
  kwords: ['leather', 'wrist', 'sheath'],
  possible_slots: [:lwrist, :rwrist],
  slot: :void,
  containing_inventory: Room.find(1).inventory,
  item_template: ItemTemplate.find_by_code('sheath_01'),
  is_sheath: true,
  inventory: Inventory.new
)

Item.create!(
  short_desc: 'a tiny jingling bell',
  long_desc: 'A tiny jingling bell makes no sound where it lies forgotten here.',
  full_desc: 'The leather strap it is attached to would allow one to wear it in either wrists or ankles, annoying people when moving around.',
  kwords: ['tiny', 'jingling', 'bell'],
  possible_slots: [:lwrist, :rwrist, :lankle, :rankle],
  slot: :rankle,
  containing_inventory: Character.find(4).inventory,
  item_template: ItemTemplate.find_by_code('deco_02')
)

Item.create!(
  short_desc: 'a wooden flute',
  long_desc: 'A wooden flute lies discarded on the ground.',
  full_desc: 'Fancy playing a few notes?',
  kwords: ['wooden', 'flute'],
  slot: :void,
  containing_inventory: Room.find(1).inventory,
  item_template: ItemTemplate.find_by_code('misc_01')
)

Item.create!(
  short_desc: 'a cloth sack',
  long_desc: 'There is a rough cloth sack here',
  full_desc: 'This sack is made of rough cloth, ideal for holding a few things.',
  kwords: ['cloth', 'sack', 'rough'],
  slot: :void,
  containing_inventory: Room.find(1).inventory,
  inventory: Inventory.new,
  item_template: ItemTemplate.find_by_code('cont_02')
)

Item.create!(
  short_desc: 'a wooden crate',
  long_desc: 'There is wooden crate here.',
  full_desc: 'The crate has some nasty splinters - be careful while manipulating it.',
  kwords: ['wooden', 'crate'],
  slot: :void,
  containing_inventory: Room.find(1).inventory,
  inventory: Inventory.new,
  item_template: ItemTemplate.find_by_code('cont_03')
)

Item.create!(
  short_desc: 'a ham sandwich',
  long_desc: 'A hitherto delicious ham sandwich gathers dust on the ground.',
  full_desc: 'It is waiting for someone to pick it up and eat it.',
  kwords: ['ham', 'sandwich'],
  stack: Amount.new(current: 7, max: 10),
  food:  Amount.new(current: 1, max: 4),
  slot: :void,
  containing_inventory: Room.find(1).inventory,
  item_template: ItemTemplate.find_by_code('food_01')
)

Item.create!(
  short_desc: 'a leather waterskin',
  long_desc: 'A leather waterskin lies on the ground.',
  full_desc: 'This waterskin would be ideal for your long treks in the forests.',
  kwords: ['leather', 'waterskin'],
  drink: Amount.new(current: 14, max: 16),
  slot: :void,
  containing_inventory: Room.find(1).inventory,
  item_template: ItemTemplate.find_by_code('water_01')
)

Item.create!(
  short_desc: 'a leather harness',
  long_desc: 'A leather harness lies in a heap here.',
  full_desc: 'Ideal for slinging it over one of the shoulders and carrying a single weapon.',
  kwords: ['leather', 'harness'],
  possible_slots: [:lshoulder, :rshoulder],
  is_sheath: true,
  inventory: Inventory.new,
  slot: :void,
  containing_inventory: Room.find(1).inventory,
  item_template: ItemTemplate.find_by_code('harn_01')
)
