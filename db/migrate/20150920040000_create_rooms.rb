class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :title, null: false
      t.text :description, null: false

      t.references :nr, null: true, index: true
      t.references :ner, null: true, index: true
      t.references :er, null: true, index: true
      t.references :ser, null: true, index: true
      t.references :sr, null: true, index: true
      t.references :swr, null: true, index: true
      t.references :wr, null: true, index: true
      t.references :nwr, null: true, index: true
      t.references :ur, null: true, index: true
      t.references :dr, null: true, index: true

      t.references :nd, null: true, index: true
      t.references :ned, null: true, index: true
      t.references :ed, null: true, index: true
      t.references :sed, null: true, index: true
      t.references :sd, null: true, index: true
      t.references :swd, null: true, index: true
      t.references :wd, null: true, index: true
      t.references :nwd, null: true, index: true
      t.references :ud, null: true, index: true
      t.references :dd, null: true, index: true
    end
  end
end
