class CreateInventoryTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :inventory_templates do |t|
      t.references :parent, null: false, index: true, polymorphic: true
    end
  end
end
