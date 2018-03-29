Protection.create!(level:  1, skill: :no_skill,      min_maneuver_penalty:   0, max_maneuver_penalty:    0, ranged_attack_penalty:   0, quickness_penalty:   0) # Naked
Protection.create!(level:  2, skill: :no_skill,      min_maneuver_penalty:   0, max_maneuver_penalty:    0, ranged_attack_penalty:   0, quickness_penalty:   0) # Regular clothes

Protection.create!(level:  3, skill: :no_skill,      min_maneuver_penalty:   0, max_maneuver_penalty:    0, ranged_attack_penalty:   0, quickness_penalty:   0) # Animal
Protection.create!(level:  4, skill: :no_skill,      min_maneuver_penalty:   0, max_maneuver_penalty:    0, ranged_attack_penalty:   0, quickness_penalty:   0) # Animal+

Protection.create!(level:  5, skill: :soft_leather,  min_maneuver_penalty:   0, max_maneuver_penalty:    0, ranged_attack_penalty:   0, quickness_penalty:   0) # Soft Leather
Protection.create!(level:  6, skill: :soft_leather,  min_maneuver_penalty:   0, max_maneuver_penalty:  -20, ranged_attack_penalty:  -5, quickness_penalty:   0) # Soft Leather Bulky
Protection.create!(level:  7, skill: :soft_leather,  min_maneuver_penalty: -10, max_maneuver_penalty:  -50, ranged_attack_penalty: -15, quickness_penalty: -10) # Soft Leather Bulky+
Protection.create!(level:  8, skill: :soft_leather,  min_maneuver_penalty: -15, max_maneuver_penalty:  -40, ranged_attack_penalty: -15, quickness_penalty: -15) # Soft Leather Bulky++

Protection.create!(level:  9, skill: :rigid_leather, min_maneuver_penalty:  -5, max_maneuver_penalty:  -50, ranged_attack_penalty:   0, quickness_penalty:   0) # Rigid Leather
Protection.create!(level: 10, skill: :rigid_leather, min_maneuver_penalty: -10, max_maneuver_penalty:  -70, ranged_attack_penalty: -10, quickness_penalty:  -5) # Rigid Leather Bulky
Protection.create!(level: 11, skill: :no_skill,      min_maneuver_penalty: -15, max_maneuver_penalty:  -90, ranged_attack_penalty: -20, quickness_penalty: -15) # Animal++
Protection.create!(level: 12, skill: :no_skill,      min_maneuver_penalty: -15, max_maneuver_penalty: -110, ranged_attack_penalty: -30, quickness_penalty: -15) # Animal+++

Protection.create!(level: 13, skill: :chain,         min_maneuver_penalty: -10, max_maneuver_penalty:  -70, ranged_attack_penalty: -15, quickness_penalty:  -5) # Chain
Protection.create!(level: 14, skill: :chain,         min_maneuver_penalty: -15, max_maneuver_penalty:  -90, ranged_attack_penalty: -25, quickness_penalty: -10) # Chain Bulky

Protection.create!(level: 15, skill: :scale,         min_maneuver_penalty: -25, max_maneuver_penalty: -120, ranged_attack_penalty: -20, quickness_penalty: -20) # Scale
Protection.create!(level: 16, skill: :scale,         min_maneuver_penalty: -25, max_maneuver_penalty: -130, ranged_attack_penalty: -25, quickness_penalty: -20) # Scale Bulky

Protection.create!(level: 17, skill: :plate,         min_maneuver_penalty: -15, max_maneuver_penalty:  -90, ranged_attack_penalty: -25, quickness_penalty: -10) # Plate
Protection.create!(level: 18, skill: :plate,         min_maneuver_penalty: -20, max_maneuver_penalty: -110, ranged_attack_penalty: -30, quickness_penalty: -20) # Plate Bulky
Protection.create!(level: 19, skill: :plate,         min_maneuver_penalty: -35, max_maneuver_penalty: -150, ranged_attack_penalty: -35, quickness_penalty: -30) # Plate Bulky+
Protection.create!(level: 20, skill: :plate,         min_maneuver_penalty: -45, max_maneuver_penalty: -165, ranged_attack_penalty: -40, quickness_penalty: -40) # Plate Bulky++
