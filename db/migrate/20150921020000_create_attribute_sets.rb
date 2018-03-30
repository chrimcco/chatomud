class CreateAttributeSets < ActiveRecord::Migration[5.1]
  def change
    create_table :attribute_sets do |t|
      t.references :character, null: false, index: true

      t.integer :str, null: false, default: 50
      t.integer :con, null: false, default: 50
      t.integer :agi, null: false, default: 50
      t.integer :dex, null: false, default: 50
      t.integer :int, null: false, default: 50
      t.integer :wil, null: false, default: 50
      t.integer :pow, null: false, default: 50
    end
  end
end
