class CreateRanks < ActiveRecord::Migration[5.1]
  def change
    create_table :ranks do |t|
      t.integer :rate, null: false, default: 0

      t.integer :value, null: false
      t.integer :bonus, null: false

      t.integer :label, null: false, default: 0
    end
  end
end
