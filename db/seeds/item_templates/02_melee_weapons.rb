ItemTemplate.create!(
  short_desc: 'a serrated dagger',
  long_desc: 'A dagger with a serrated edge has been discarded here.',
  full_desc: 'It possesses a serrated edge, designed for maximum damage.',
  kwords: ['serrated', 'dagger'],
  code: 'weap_02',
  weapon_stat_template: WeaponStatTemplate.new(
    skill: :dagger,
    melee_stat_template: MeleeStatTemplate.new(
      sheathed_desc: 'a dagger'
    )
  )
)

ItemTemplate.create!(
  short_desc: 'a rusty longsword',
  long_desc: 'A longsword covered in rust lies on the ground.',
  full_desc: 'Rusty und battered? Yes. Dangerous? Yeah, that too.',
  kwords: ['rusty', 'longsword', 'sword'],
  code: 'weap_03',
  weapon_stat_template: WeaponStatTemplate.new(
    grip: :both,
    skill: :longsword,
    melee_stat_template: MeleeStatTemplate.new(
      sheathed_desc: 'a longsword'
    )
  )
)

ItemTemplate.create!(
  short_desc: 'a steel greatsword',
  long_desc: 'A steel greatsword has been left here.',
  full_desc: 'Huge and sharp. Most likely you will need to hands to wield this cumbersome weapon.',
  kwords: ['steel', 'greatsword'],
  code: 'weap_05',
  weapon_stat_template: WeaponStatTemplate.new(
    grip: :two_handed,
    skill: :greatsword,
    melee_stat_template: MeleeStatTemplate.new(
      sheathed_desc: 'a greatsword'
    )
  )
)
