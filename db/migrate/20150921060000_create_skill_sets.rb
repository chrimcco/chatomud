class CreateSkillSets < ActiveRecord::Migration[5.1]
  def change
    create_table :skill_sets do |t|
      t.references :character, null: false, index: true

      ## Categories
      # Armor
      t.integer :heavy_armor, null: false
      t.integer :medium_armor, null: false
      t.integer :light_armor, null: false

      # Edged weaponry
      t.integer :light_edge, null: false
      t.integer :medium_edge, null: false
      t.integer :heavy_edge, null: false

      # Piercing weaponry
      t.integer :light_pierce, null: false
      t.integer :medium_pierce, null: false
      t.integer :heavy_pierce, null: false

      # Blunt weaponry
      t.integer :light_blunt, null: false
      t.integer :medium_blunt, null: false
      t.integer :heavy_blunt, null: false

      # Missile Weaponry
      t.integer :missile_weaponry, null: false

      # Martial
      t.integer :martial, null: false

      # Body capabilities
      t.integer :athletics, null: false

      ## Skills
      # Heavy armor
      t.integer :plate, null: false

      # Medium armor
      t.integer :scale, null: false
      t.integer :chain, null: false
      
      # Light armor
      t.integer :soft_leather, null: false
      t.integer :rigid_leather, null: false

      # Light-edge weapons
      t.integer :dagger, null: false
      t.integer :shortsword, null: false

      # Medium-edge weapons
      t.integer :longsword, null: false
      t.integer :broadsword, null: false
      t.integer :falchion, null: false
      t.integer :handaxe, null: false
      t.integer :scimitar, null: false

      # Heavy-edge weapons
      t.integer :battleaxe, null: false
      t.integer :greatsword, null: false

      # Light-blunt weapons
      t.integer :quarterstaff, null: false
      t.integer :warhammer, null: false

      # Medium-blunt weapons
      t.integer :club, null: false
      t.integer :mace, null: false
      t.integer :morningstar, null: false

      # Heavy-blunt weapons
      t.integer :flail, null: false
      t.integer :warmattock, null: false

      # Light-pierce weapons
      t.integer :rapier, null: false
      t.integer :stiletto, null: false

      # Medium-pierce weapons
      t.integer :javelin, null: false
      t.integer :spear, null: false

      # Heavy-pierce weapons
      t.integer :lance, null: false

      # Missile Weaponry
      t.integer :shortbow, null: false
      t.integer :longbow, null: false
      t.integer :crossbow, null: false

      # Martial
      t.integer :block, null: false
      t.integer :parry, null: false
      t.integer :dual_wield, null: false
      t.integer :throw, null: false

      # Athletics
      t.integer :brawl, null: false
      t.integer :body_development, null: false
      t.integer :dodge, null: false
    end
  end
end
