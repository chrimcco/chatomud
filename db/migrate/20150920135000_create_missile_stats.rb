class CreateMissileStats < ActiveRecord::Migration[5.1]
  def change
    create_table :missile_stats do |t|
      t.references :item, index: true

      t.integer :missile_type, null: false, default: 0
    end
  end
end
