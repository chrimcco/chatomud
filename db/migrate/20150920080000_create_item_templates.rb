class CreateItemTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :item_templates do |t|
      t.string :short_desc, null: false
      t.string :long_desc,  null: false
      t.text   :full_desc,  null: false
      t.string :kwords, null: false, array: true, default: [].to_yaml

      t.string :code, null: false

      t.boolean :is_sheath, default: false

      t.boolean :is_quiver, default: false

      t.string :possible_slots, null: false, array: true, default: [].to_yaml
    end
  end
end
