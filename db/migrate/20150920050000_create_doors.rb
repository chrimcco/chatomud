class CreateDoors < ActiveRecord::Migration[5.1]
  def change
    create_table :doors do |t|
      t.string :short_desc, null: false
      t.string :long_desc,  null: false
      t.text   :full_desc,  null: false
      t.boolean :open, null: false, default: false
      t.boolean :see_through, null: false, default: false

      t.references :nr,  null: true, index: true
      t.references :ner, null: true, index: true
      t.references :er,  null: true, index: true
      t.references :ser, null: true, index: true
      t.references :sr,  null: true, index: true
      t.references :swr, null: true, index: true
      t.references :wr,  null: true, index: true
      t.references :nwr, null: true, index: true
      t.references :ur,  null: true, index: true
      t.references :dr,  null: true, index: true
    end
  end
end
