nw = Room.create!(
  title: 'NW Room',
  description: 'This is the northwestern room.',
  inventory: Inventory.new
)

ne = Room.create!(
  title: 'NE Room',
  description: 'This is the northeastern room.',
  inventory: Inventory.new
)

sw = Room.create!(
  title: 'SW Room',
  description: 'This is the southwestern room.',
  inventory: Inventory.new
)

se = Room.create!(
  title: 'SE Room',
  description: 'This is the southeastern room.',
  inventory: Inventory.new
)

u = Room.create!(
  title: 'The attic',
  description: 'This is the attic.',
  inventory: Inventory.new
)

d = Room.create!(
  title: 'Cellar',
  description: 'This is the cellar. Beware of monsters in the dark.',
  inventory: Inventory.new
)

nw.update_attributes!(er: ne, sr: sw, ur: u, dr: d)

ne.update_attributes!(wr: nw, sr: se)

sw.update_attributes!(nr: nw, er: se)

se.update_attributes!(nr: ne, wr: sw)

u.update_attributes!(dr: nw)

d.update_attributes!(ur: nw)
