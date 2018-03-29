class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.string :name

      t.string :short_desc, null: false
      t.string :long_desc,  null: false
      t.text   :full_desc,  null: false
      t.string :kwords, array: true

      t.boolean :npc, default: false

      t.boolean :active, default: false

      t.integer :gender, null: false, default: 0

      t.references :player, index: true

      t.references :room, index: true, null: false
    end
  end

end
