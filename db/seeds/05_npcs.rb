Character.create!(
  name: 'Halred',
  short_desc: 'a straw-colored, wavy-haired young man',
  long_desc: 'A straw-haired, wavy-haired young man is here.',
  full_desc: 'One of the many guards in the area. He looks ready for combat.',
  kwords: ['halred', 'straw-colored', 'colored', 'wavy-haired', 'haired', 'young', 'man'],
  gender: :male,
  npc: true,
  room: Room.find(1),
  inventory: Inventory.new,
  attribute_set: AttributeSet.new(
    str: 70,
    con: 60,
    agi: 50,
    dex: 55,
    int: 33,
    wil: 80,
    pow: 52
  ),
  choice: Choice.new(
    stance: :normal
  ),
  health: Health.new,
  skill_set: SkillSet.new(
    heavy_armor:  4,
    medium_armor: 2,
    light_armor:  8,

    light_edge: 5,
    medium_edge: 7,
    heavy_edge: 10,

    light_pierce: 2,
    medium_pierce: 11,
    heavy_pierce: 20,

    light_blunt: 0,
    medium_blunt: 5,
    heavy_blunt: 8,

    missile_weaponry: 24,

    martial: 17,

    athletics: 6,

    plate: 7,

    chain: 7,
    scale: 7,

    soft_leather: 7,

    rigid_leather: 7,

    dagger: 5,
    shortsword: 5,

    longsword: 5,
    broadsword: 5,
    falchion: 5,
    handaxe: 5,
    scimitar: 5,

    battleaxe: 5,
    greatsword: 5,

    quarterstaff: 5,
    warhammer: 5,

    club: 5,
    mace: 5,
    morningstar: 5,

    flail: 5,
    warmattock: 5,

    rapier: 5,
    stiletto: 5,

    javelin: 5,
    spear: 5,

    lance: 5,

    shortbow: 3,
    longbow: 13,
    crossbow: 8,

    block: 13,
    parry: 14,
    dual_wield: 10,
    throw: 9,

    brawl: 8,
    body_development: 17,
    dodge: 8

  )
)
