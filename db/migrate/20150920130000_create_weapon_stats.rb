class CreateWeaponStats < ActiveRecord::Migration[5.1]
  def change
    create_table :weapon_stats do |t|
      t.references :item, index: true

      t.integer :grip, null: false, default: 0

      t.integer :skill, null: false
    end
  end
end
