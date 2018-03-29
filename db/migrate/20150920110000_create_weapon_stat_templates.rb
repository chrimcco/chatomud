class CreateWeaponStatTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :weapon_stat_templates do |t|
      t.references :item_template, index: true

      t.integer :grip, null: false, default: 0

      t.integer :skill, null: false
    end
  end
end
