class CreateItemsLocks < ActiveRecord::Migration[5.1]
  def change
    create_table :items_locks, id: false do |t|
      t.references :item, null: false, index: true
      t.references :lock, null: false, index: true
    end
  end
end
