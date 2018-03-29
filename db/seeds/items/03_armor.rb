Item.create!(
  short_desc: 'an iron spangen-helm',
  long_desc: 'An iron spangen-helm sits on the ground.',
  full_desc: 'Look it up in google. Really. I do not feel like writing an elaborate description right now.',
  kwords: ['iron', 'spangen-helm', 'helm'],
  slot: :head,
  possible_slots: [:head],
  containing_inventory: Character.find(1).inventory,
  armor_stat: ArmorStat.new(
    level: 17,
    body_parts: [:head, :face],
    maneuver_impediment: :lowest_mi,
    ranged_attack_impediment: :no_rai
  ),
  item_template: ItemTemplate.find_by_code('helm_01')
)

Item.create!(
  short_desc: 'a shirt of iron chainmail',
  long_desc: 'A shirt of iron chainmail is here, folded.',
  full_desc: 'Iron. Chainmail. Were you expecting a detailed description?',
  kwords: ['shirt', 'iron', 'chainmail'],
  slot: :torso,
  possible_slots: [:torso],
  containing_inventory: Character.find(1).inventory,
  armor_stat: ArmorStat.new(
    level: 13,
    body_parts: [:groin, :chest, :abdomen, :lside, :rside, :back, :lshoulder, :rshoulder, :larm, :rarm, :lhip, :rhip],
    maneuver_impediment: :highest_mi,
    ranged_attack_impediment: :medium_rai
  ),
  item_template: ItemTemplate.find_by_code('armor_01')
)

Item.create!(
  short_desc: 'a pair of leather leggings',
  long_desc: 'Some leather leggings have been left aside.',
  full_desc: 'They look fit for Freddy Mercury.',
  kwords: ['leather', 'leggings'],
  slot: :legs,
  possible_slots: [:legs],
  containing_inventory: Character.find(1).inventory,
  armor_stat: ArmorStat.new(
    level: 5,
    body_parts: [:groin, :lhip, :rhip, :lthigh, :rthigh, :lknee, :rknee, :lshin, :rshin, :lankle, :rankle],
    maneuver_impediment: :high_mi,
    ranged_attack_impediment: :no_rai
  ),
  item_template: ItemTemplate.find_by_code('armor_02')
)
