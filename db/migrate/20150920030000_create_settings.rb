class CreateSettings < ActiveRecord::Migration[5.1]

  def change
    create_table :settings do |t|
      t.boolean :ansi_coloring, default: false

      t.references :player, null: false, index: true
    end
  end

end
