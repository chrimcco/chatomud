class CreateAttributeSets < ActiveRecord::Migration[5.1]
  def change
    create_table :attribute_sets do |t|
      t.references :character, null: false, index: true

      t.integer :str, null: false
      t.integer :con, null: false
      t.integer :agi, null: false
      t.integer :dex, null: false
      t.integer :int, null: false
      t.integer :wil, null: false
      t.integer :pow, null: false
    end
  end
end
