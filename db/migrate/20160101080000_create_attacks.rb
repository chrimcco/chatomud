class CreateAttacks < ActiveRecord::Migration[5.1]
  def change
    create_table :attacks do |t|
      t.boolean :connects, default: true

      t.integer :score_limit, null: false

      t.integer :skill, null: false

      t.integer :against, null: false

      t.integer :hits, null: false
      t.integer :critical_severity, null: false
      t.integer :critical_type, null: false
    end
  end
end