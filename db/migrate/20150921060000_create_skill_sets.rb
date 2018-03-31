class CreateSkillSets < ActiveRecord::Migration[5.1]
  def change
    create_table :skill_sets do |t|
      t.references :character, null: false, index: true

      ## Categories
      # Armor
      t.integer :heavy_armor, null: false, default: 8
      t.integer :medium_armor, null: false, default: 8
      t.integer :light_armor, null: false, default: 8

      # Edged weaponry
      t.integer :light_edge, null: false, default: 8
      t.integer :medium_edge, null: false, default: 8
      t.integer :heavy_edge, null: false, default: 8

      # Piercing weaponry
      t.integer :light_pierce, null: false, default: 8
      t.integer :medium_pierce, null: false, default: 8
      t.integer :heavy_pierce, null: false, default: 8

      # Blunt weaponry
      t.integer :light_blunt, null: false, default: 8
      t.integer :medium_blunt, null: false, default: 8
      t.integer :heavy_blunt, null: false, default: 8

      # Missile Weaponry
      t.integer :missile_weaponry, null: false, default: 8

      # Martial
      t.integer :martial, null: false, default: 8

      # Body capabilities
      t.integer :athletics, null: false, default: 8

      ## Skills
      # Heavy armor
      t.integer :plate, null: false, default: 8

      # Medium armor
      t.integer :scale, null: false, default: 8
      t.integer :chain, null: false, default: 8
      
      # Light armor
      t.integer :soft_leather, null: false, default: 8
      t.integer :rigid_leather, null: false, default: 8

      # Light-edge weapons
      t.integer :dagger, null: false, default: 8
      t.integer :shortsword, null: false, default: 8

      # Medium-edge weapons
      t.integer :longsword, null: false, default: 8
      t.integer :broadsword, null: false, default: 8
      t.integer :falchion, null: false, default: 8
      t.integer :handaxe, null: false, default: 8
      t.integer :scimitar, null: false, default: 8

      # Heavy-edge weapons
      t.integer :battleaxe, null: false, default: 8
      t.integer :greatsword, null: false, default: 8

      # Light-blunt weapons
      t.integer :quarterstaff, null: false, default: 8
      t.integer :warhammer, null: false, default: 8

      # Medium-blunt weapons
      t.integer :club, null: false, default: 8
      t.integer :mace, null: false, default: 8
      t.integer :morningstar, null: false, default: 8

      # Heavy-blunt weapons
      t.integer :flail, null: false, default: 8
      t.integer :warmattock, null: false, default: 8

      # Light-pierce weapons
      t.integer :rapier, null: false, default: 8
      t.integer :stiletto, null: false, default: 8

      # Medium-pierce weapons
      t.integer :javelin, null: false, default: 8
      t.integer :spear, null: false, default: 8

      # Heavy-pierce weapons
      t.integer :lance, null: false, default: 8

      # Missile Weaponry
      t.integer :shortbow, null: false, default: 8
      t.integer :longbow, null: false, default: 8
      t.integer :crossbow, null: false, default: 8

      # Martial
      t.integer :block, null: false, default: 8
      t.integer :parry, null: false, default: 8
      t.integer :dual_wield, null: false, default: 8
      t.integer :throwing, null: false, default: 8

      # Athletics
      t.integer :brawl, null: false, default: 8
      t.integer :body_development, null: false, default: 8
      t.integer :dodge, null: false, default: 8
    end
  end
end
