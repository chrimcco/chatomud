class CreateCharacterOutfitters < ActiveRecord::Migration[5.1]
  def change
    create_table :character_outfitters do |t|
      t.text :item_template_codes, null: false
      t.string :code, null: false
    end
  end
end
