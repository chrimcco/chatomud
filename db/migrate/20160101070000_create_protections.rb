class CreateProtections < ActiveRecord::Migration[5.1]
  def change
    create_table :protections do |t|
      t.integer :level, null: false

      t.integer :skill, null: false

      t.integer :min_maneuver_penalty, null: false
      t.integer :max_maneuver_penalty, null: false

      t.integer :ranged_attack_penalty, null: false

      t.integer :quickness_penalty, null: false
    end
  end
end
