ItemTemplate.create!(
  short_desc: 'a yew shortbow',
  long_desc: 'A yew shortbow is here.',
  full_desc: 'A. Yew. Shortbow.',
  kwords: ['yew', 'bow', 'shortbow'],
  code: 'weap_06',
  weapon_stat_template: WeaponStatTemplate.new(
    grip: :both,
    skill: :shortbow,
    ranged_stat_template: RangedStatTemplate.new(
      inventory_template: InventoryTemplate.new,
      missile_type: :arrow,
      ranges_suitability: [:short_range, :point_blank, :medium_range, :long_range],
      can_remain_loaded: false
    )
  )
)

ItemTemplate.create!(
  short_desc: 'a sturdy crossbow',
  long_desc: 'A sturdy crossbow is here.',
  full_desc: 'A. Sturdy. Crossbow.',
  kwords: ['sturdy', 'crossbow'],
  code: 'weap_07',
  weapon_stat_template: WeaponStatTemplate.new(
    grip: :both,
    skill: :crossbow,
    ranged_stat_template: RangedStatTemplate.new(
      inventory_template: InventoryTemplate.new,
      missile_type: :bolt,
      ranges_suitability: [:point_blank, :short_range, :medium_range, :long_range],
      can_remain_loaded: true
    )
  )
)