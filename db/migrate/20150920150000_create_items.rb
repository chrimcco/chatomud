class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :short_desc, null: false
      t.string :long_desc,  null: false
      t.text   :full_desc,  null: false
      t.string :kwords, null: false, array: true, default: [].to_yaml

      t.string :possible_slots, null: false, array: true, default: [].to_yaml
      t.integer :slot, null: false, default: 0

      t.boolean :is_sheath, default: false

      t.boolean :is_quiver, default: false

      t.references :containing_inventory, null: false, index: true

      t.references :item_template, null: false, index: true
    end
  end
end
