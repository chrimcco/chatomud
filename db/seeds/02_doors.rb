nw_ne = Door.create!(
  short_desc: 'door',
  long_desc: 'a wooden door',
  full_desc: 'Your regular wooden door. Not fancy.',
  see_through: false
)

nw_d = Door.create!(
  short_desc: 'grate',
  long_desc: 'a metal grate',
  full_desc: 'A reinforced metal grate, with a lock. Looks sturdy.',
  lock: Lock.new(
    locked: true
  ),
  see_through: true
)

nw_sw = Door.create!(
  short_desc: 'gate',
  long_desc: 'an ornated gate',
  full_desc: 'You almost feel like saying -friend- in front of it.',
  see_through: true
)

nw = Room.first
ne = Room.second
d  = Room.find(6)
sw = Room.third

nw.update_attributes(ed: nw_ne, dd: nw_d, sd: nw_sw)
ne.update_attributes(wd: nw_ne)
d.update_attributes(ud: nw_d)
sw.update_attributes(nd: nw_sw)
