Character.create!(
  name: 'Gunnbjorn',
  short_desc: 'a strapping man with a blond beard',
  long_desc: 'A strapping man with a blond beard is here.',
  full_desc: 'This is Gunns full description.',
  kwords: ['gunnbjorn', 'strapping', 'strapping', 'man'],
  gender: :male,
  active: true,
  player: Player.find(1),
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
  health: Health.new(
    wounds: [
      Wound.new(damage: 8, damage_type: :slash, body_part: :rthigh, inventory: nil),
      Wound.new(damage: 25, damage_type: :crush, body_part: :face, inventory: nil)
    ]
  ),
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

    missile_weaponry: 14,

    martial: 14,

    athletics: 9,

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

    block: 8,
    parry: 11,
    dual_wield: 5,
    throwing: 3,

    brawl: 4,
    body_development: 13,
    dodge: 8
  )
)

Character.create!(
  name: 'Irzan',
  short_desc: 'an olive-toned man with a pointy beard',
  long_desc: 'An olive-toned man with a pointy beard is here.',
  full_desc: 'This is Irzans description.',
  kwords: ['irzan', 'olive-toned', 'pointy', 'beard', 'man'],
  gender: :male,
  active: true,
  player: Player.find(2),
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

    missile_weaponry: 30,

    martial: 10,

    athletics: 9,

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

    block: 8,
    parry: 11,
    dual_wield: 17,
    throwing: 3,

    brawl: 4,
    body_development: 17,
    dodge: 18
  )
)

Character.create!(
  name: 'Shianek',
  short_desc: 'an able-boded woman with knife-cropped hair',
  long_desc: 'An able-bodied woman with knife-cropped hair is here.',
  full_desc: 'This is Shianeks description.',
  kwords: ['shianek', 'able-bodied', 'knife-cropped', 'woman'],
  gender: :female,
  active: true,
  player: Player.find(3),
  room: Room.find(3),
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

    missile_weaponry: 10,

    martial: 3,

    athletics: 2,

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

    block: 3,
    parry: 7,
    dual_wield: 0,
    throwing: 19,

    brawl: 1,
    body_development: 8,
    dodge: 20
  )
)
