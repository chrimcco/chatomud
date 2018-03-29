class CreateAmounts < ActiveRecord::Migration[5.1]
  def change
    create_table :amounts do |t|
      t.integer :current, null: false
      t.integer :max, null: false

      t.integer :fluid, null: false, default: 0

      t.references :stackable, null: true, index: true
      t.references :edible,    null: true, index: true
      t.references :drinkable, null: true, index: true
    end


  end
end
