class CreateSkillCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :skill_categories do |t|
      t.integer :name, null: false

      t.string :dependencies, null: false, array: true, default: [].to_yaml
    end
  end
end
