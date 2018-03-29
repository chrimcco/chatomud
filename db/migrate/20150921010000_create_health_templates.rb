class CreateHealthTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :health_templates do |t|
      t.references :character_template, null: false, index: true
    end
  end
end
