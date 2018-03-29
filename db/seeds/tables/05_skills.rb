## Armor
# Heavy armor
Skill.create!(name: :plate,            skill_category: :heavy_armor,       dependencies: [:str, :str, :wil])

# Medium armor
Skill.create!(name: :chain,            skill_category: :medium_armor,      dependencies: [:str, :agi, :con])
Skill.create!(name: :scale,            skill_category: :medium_armor,      dependencies: [:str, :str, :agi])

# Light armor
Skill.create!(name: :soft_leather,     skill_category: :light_armor,       dependencies: [:agi, :agi, :con])
Skill.create!(name: :rigid_leather,    skill_category: :light_armor,       dependencies: [:agi, :agi, :str])

## Weapons
# Light-edge
Skill.create!(name: :dagger,           skill_category: :light_edge,        dependencies: [:dex, :int, :agi]) # in CSV
Skill.create!(name: :shortsword,       skill_category: :light_edge,        dependencies: [:dex, :dex, :agi]) # in CSV

# Medium-edge
Skill.create!(name: :longsword,        skill_category: :medium_edge,       dependencies: [:str, :agi, :dex]) # in CSV
Skill.create!(name: :broadsword,       skill_category: :medium_edge,       dependencies: [:str, :str, :dex]) # in CSV
Skill.create!(name: :falchion,         skill_category: :medium_edge,       dependencies: [:str, :con, :dex]) # in CSV
Skill.create!(name: :handaxe,          skill_category: :medium_edge,       dependencies: [:str, :agi, :dex]) # in CSV
Skill.create!(name: :scimitar,         skill_category: :medium_edge,       dependencies: [:str, :dex, :int]) # in CSV

# Heavy-edge
Skill.create!(name: :battleaxe,        skill_category: :heavy_edge,        dependencies: [:str, :str, :agi]) # in CSV
Skill.create!(name: :greatsword,       skill_category: :heavy_edge,        dependencies: [:str, :str, :dex]) # in CSV

# Light-blunt
Skill.create!(name: :quarterstaff,     skill_category: :light_blunt,       dependencies: [:str, :dex, :agi]) # in CSV
Skill.create!(name: :warhammer,        skill_category: :light_blunt,       dependencies: [:str, :dex, :dex]) # in CSV

# Medium-blunt
Skill.create!(name: :club,             skill_category: :medium_blunt,      dependencies: [:str, :dex, :con]) # in CSV
Skill.create!(name: :mace,             skill_category: :medium_blunt,      dependencies: [:str, :agi, :con]) # in CSV
Skill.create!(name: :morningstar,      skill_category: :medium_blunt,      dependencies: [:str, :dex, :dex]) # in CSV

# Heavy-blunt
Skill.create!(name: :flail,            skill_category: :heavy_blunt,       dependencies: [:str, :str, :agi]) # in CSV
Skill.create!(name: :warmattock,       skill_category: :heavy_blunt,       dependencies: [:str, :con, :agi]) # in CSV

# Light-pierce
Skill.create!(name: :rapier,           skill_category: :light_pierce,      dependencies: [:dex, :agi, :int]) # in CSV
Skill.create!(name: :stiletto,         skill_category: :light_pierce,      dependencies: [:dex, :dex, :int]) # in CSV

# Medium-pierce
Skill.create!(name: :javelin,          skill_category: :medium_pierce,     dependencies: [:str, :agi, :dex]) # in CSV
Skill.create!(name: :spear,            skill_category: :medium_pierce,     dependencies: [:str, :agi, :agi]) # in CSV

# Heavy pierce
Skill.create!(name: :lance,            skill_category: :heavy_pierce,      dependencies: [:str, :str, :dex]) # in CSV

# Missile Weaponry
Skill.create!(name: :shortbow,         skill_category: :missile_weaponry,  dependencies: [:dex, :dex, :int]) # in CSV
Skill.create!(name: :longbow,          skill_category: :missile_weaponry,  dependencies: [:dex, :str, :int])
Skill.create!(name: :crossbow,         skill_category: :missile_weaponry,  dependencies: [:dex, :int, :int])

# Martial
Skill.create!(name: :block,            skill_category: :martial,           dependencies: [:str, :dex, :wil])
Skill.create!(name: :parry,            skill_category: :martial,           dependencies: [:dex, :agi, :int])
Skill.create!(name: :dual_wield,       skill_category: :martial,           dependencies: [:dex, :dex, :int])
Skill.create!(name: :throw,            skill_category: :martial,           dependencies: [:agi, :dex, :dex])

# Body capabilities
Skill.create!(name: :body_development, skill_category: :athletics,         dependencies: [:con, :con, :pow])
Skill.create!(name: :brawl,            skill_category: :athletics,         dependencies: [:str, :agi, :dex]) # in CSV
Skill.create!(name: :dodge,            skill_category: :athletics,         dependencies: [:agi, :pow, :dex])