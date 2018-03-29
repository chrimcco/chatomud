class CreateAttributeSetTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :attribute_set_templates do |t|
      t.references :character_template, null: false, index: true

      t.string :preference, null: false, array: true, default: [].to_yaml
    end
  end
end
