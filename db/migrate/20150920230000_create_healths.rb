class CreateHealths < ActiveRecord::Migration[5.1]
  def change
    create_table :healths do |t|
      t.references :character, null: false, index: true
    end
  end
end
