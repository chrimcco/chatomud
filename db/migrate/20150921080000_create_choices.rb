class CreateChoices < ActiveRecord::Migration[5.1]

  def change
    create_table :choices do |t|
      t.integer :stance, null: false, default: 3

      t.references :character, null: false, index: true
    end
  end

end
