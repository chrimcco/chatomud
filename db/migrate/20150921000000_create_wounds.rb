class CreateWounds < ActiveRecord::Migration[5.1]
  def change
    create_table :wounds do |t|
      t.integer :damage, null: false

      t.integer :damage_type, null: false

      t.integer :body_part, null: false

      t.references :health, null: false, index: true
    end
  end
end
