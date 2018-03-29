class CreateArmorStatTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :armor_stat_templates do |t|
      t.references :item_template, index: true

      t.integer :level, null: false

      t.integer :maneuver_impediment, null: false

      t.integer :ranged_attack_impediment, null: false

      t.string :body_parts, null: false, array: true, default: [].to_yaml
    end
  end
end
