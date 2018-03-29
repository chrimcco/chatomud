# Armor
SkillCategory.create!(name: :heavy_armor,        dependencies: [:str, :str, :wil])
SkillCategory.create!(name: :medium_armor,       dependencies: [:str, :agi, :wil])
SkillCategory.create!(name: :light_armor,        dependencies: [:str, :agi, :agi])

# Edged weaponry
SkillCategory.create!(name: :light_edge,         dependencies: [:str, :dex, :dex])
SkillCategory.create!(name: :medium_edge,        dependencies: [:str, :str, :dex])
SkillCategory.create!(name: :heavy_edge,         dependencies: [:str, :str, :con])

# Piercing weaponry
SkillCategory.create!(name: :light_pierce,       dependencies: [:agi, :dex, :dex])
SkillCategory.create!(name: :medium_pierce,      dependencies: [:agi, :str, :dex])
SkillCategory.create!(name: :heavy_pierce,       dependencies: [:agi, :str, :con])

# Blunt weaponry
SkillCategory.create!(name: :light_blunt,        dependencies: [:str, :dex, :agi])
SkillCategory.create!(name: :medium_blunt,       dependencies: [:str, :str, :agi])
SkillCategory.create!(name: :heavy_blunt,        dependencies: [:str, :str, :con])

# Missile weaponry
SkillCategory.create!(name: :missile_weaponry,   dependencies: [:dex, :dex, :int])

# Martial
SkillCategory.create!(name: :martial,            dependencies: [:str, :dex, :con])

# Body capabilities
SkillCategory.create!(name: :athletics,          dependencies: [:str, :con, :agi])
