ItemTemplate.create!(
  short_desc: 'a black leather hood',
  long_desc: 'A black leather hood rests in a heap here.',
  full_desc: 'This piece of leather resembles a hood of black leather. A strong smell surrounds it.',
  kwords: ['black', 'leather', 'hood'],
  possible_slots: [:head],
  code: 'hood_01',
  armor_stat_template: ArmorStatTemplate.new(
    level: 2,
    body_parts: [:head, :face],
    maneuver_impediment: :lowest_mi,
    ranged_attack_impediment: :no_rai
  )
)

ItemTemplate.create!(
  short_desc: 'an iron spangen-helm',
  long_desc: 'An iron spangen-helm sits on the ground',
  full_desc: 'Look it up in google. Really. I do not feel like writing an elaborate description right now.',
  kwords: ['iron', 'spangen-helm', 'helm'],
  possible_slots: [:head],
  code: 'helm_01',
  armor_stat_template: ArmorStatTemplate.new(
    level: 17,
    body_parts: [:head, :face],
    maneuver_impediment: :lowest_mi,
    ranged_attack_impediment: :no_rai
  )
)

ItemTemplate.create!(
  short_desc: 'a shirt of iron chainmail',
  long_desc: 'A shirt of iron chainmail is here, folded.',
  full_desc: 'Iron. Chainmail. Were you expecting a detailed description?',
  kwords: ['shirt', 'iron', 'chainmail'],
  possible_slots: [:torso],
  code: 'armor_01',
  armor_stat_template: ArmorStatTemplate.new(
    level: 13,
    body_parts: [:chest, :abdomen, :lside, :rside, :back, :lshoulder, :rshoulder, :larm, :rarm, :lhip, :rhip],
    maneuver_impediment: :highest_mi,
    ranged_attack_impediment: :medium_rai
  )
)

ItemTemplate.create!(
  short_desc: 'a pair of leather leggings',
  long_desc: 'Some leather leggings have been left aside.',
  full_desc: 'They look fit for Freddy Mercury.',
  kwords: ['leather', 'leggings'],
  possible_slots: [:legs],
  code: 'armor_02',
  armor_stat_template: ArmorStatTemplate.new(
    level: 5,
    body_parts: [:groin, :lhip, :rhip, :lthigh, :rthigh, :lknee, :rknee, :lshin, :rshin, :lankle, :rankle],
    maneuver_impediment: :high_mi,
    ranged_attack_impediment: :no_rai
  )
)