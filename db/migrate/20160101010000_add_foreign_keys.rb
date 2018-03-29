class AddForeignKeys < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :settings, :players, on_delete: :cascade

    add_foreign_key :rooms, :rooms, column: :nr_id,  on_delete: :restrict
    add_foreign_key :rooms, :rooms, column: :ner_id, on_delete: :restrict
    add_foreign_key :rooms, :rooms, column: :er_id,  on_delete: :restrict
    add_foreign_key :rooms, :rooms, column: :ser_id, on_delete: :restrict
    add_foreign_key :rooms, :rooms, column: :sr_id,  on_delete: :restrict
    add_foreign_key :rooms, :rooms, column: :swr_id, on_delete: :restrict
    add_foreign_key :rooms, :rooms, column: :wr_id,  on_delete: :restrict
    add_foreign_key :rooms, :rooms, column: :nwr_id, on_delete: :restrict
    add_foreign_key :rooms, :rooms, column: :ur_id,  on_delete: :restrict
    add_foreign_key :rooms, :rooms, column: :dr_id,  on_delete: :restrict

    add_foreign_key :rooms, :doors, column: :nd_id,  on_delete: :restrict
    add_foreign_key :rooms, :doors, column: :ned_id, on_delete: :restrict
    add_foreign_key :rooms, :doors, column: :ed_id,  on_delete: :restrict
    add_foreign_key :rooms, :doors, column: :sed_id, on_delete: :restrict
    add_foreign_key :rooms, :doors, column: :sd_id,  on_delete: :restrict
    add_foreign_key :rooms, :doors, column: :swd_id, on_delete: :restrict
    add_foreign_key :rooms, :doors, column: :wd_id,  on_delete: :restrict
    add_foreign_key :rooms, :doors, column: :nwd_id, on_delete: :restrict
    add_foreign_key :rooms, :doors, column: :ud_id,  on_delete: :restrict
    add_foreign_key :rooms, :doors, column: :dd_id,  on_delete: :restrict

    add_foreign_key :doors, :rooms, column: :nr_id,  on_delete: :restrict
    add_foreign_key :doors, :rooms, column: :ner_id, on_delete: :restrict
    add_foreign_key :doors, :rooms, column: :er_id,  on_delete: :restrict
    add_foreign_key :doors, :rooms, column: :ser_id, on_delete: :restrict
    add_foreign_key :doors, :rooms, column: :sr_id,  on_delete: :restrict
    add_foreign_key :doors, :rooms, column: :swr_id, on_delete: :restrict
    add_foreign_key :doors, :rooms, column: :wr_id,  on_delete: :restrict
    add_foreign_key :doors, :rooms, column: :nwr_id, on_delete: :restrict
    add_foreign_key :doors, :rooms, column: :ur_id,  on_delete: :restrict
    add_foreign_key :doors, :rooms, column: :dr_id,  on_delete: :restrict

    add_foreign_key :characters, :players, on_delete: :cascade
    add_foreign_key :characters, :rooms, on_delete: :restrict

    add_foreign_key :furnitures, :rooms, on_delete: :restrict
    
    add_foreign_key :amount_templates, :item_templates, on_delete: :cascade, column: :stackable_id
    add_foreign_key :amount_templates, :item_templates, on_delete: :cascade, column: :edible_id
    add_foreign_key :amount_templates, :item_templates, on_delete: :cascade, column: :drinkable_id

    add_foreign_key :lid_templates, :inventory_templates, on_delete: :cascade

    add_foreign_key :weapon_stat_templates, :item_templates, on_delete: :cascade
    add_foreign_key :melee_stat_templates, :weapon_stat_templates, on_delete: :cascade
    add_foreign_key :ranged_stat_templates, :weapon_stat_templates, on_delete: :cascade
    
    add_foreign_key :missile_stat_templates, :item_templates, on_delete: :cascade

    add_foreign_key :items, :inventories, column: :containing_inventory_id, on_delete: :cascade
    add_foreign_key :items, :item_templates, column: :item_template_id, on_delete: :cascade

    add_foreign_key :weapon_stats, :items, on_delete: :cascade
    add_foreign_key :melee_stats, :weapon_stats, on_delete: :cascade
    add_foreign_key :ranged_stats, :weapon_stats, on_delete: :cascade
    
    add_foreign_key :missile_stats, :items, on_delete: :cascade

    add_foreign_key :lids, :inventories, on_delete: :cascade

    add_foreign_key :amounts, :items, on_delete: :cascade, column: :stackable_id
    add_foreign_key :amounts, :items, on_delete: :cascade, column: :edible_id
    add_foreign_key :amounts, :items, on_delete: :cascade, column: :drinkable_id

    add_foreign_key :items_locks, :items, on_delete: :cascade
    add_foreign_key :items_locks, :locks, on_delete: :cascade

    add_foreign_key :healths, :characters, on_delete: :cascade

    add_foreign_key :health_templates, :character_templates, on_delete: :cascade

    add_foreign_key :wounds, :healths, on_delete: :cascade

    add_foreign_key :attribute_set_templates, :character_templates, on_delete: :cascade    

    add_foreign_key :armor_stats, :items, on_delete: :cascade

    add_foreign_key :shield_stats, :items, on_delete: :cascade

    add_foreign_key :armor_stat_templates, :item_templates, on_delete: :cascade

    add_foreign_key :shield_stat_templates, :item_templates, on_delete: :cascade

    add_foreign_key :attribute_sets, :characters, on_delete: :cascade    

    add_foreign_key :skill_sets, :characters, on_delete: :cascade    

    add_foreign_key :skill_set_templates, :character_templates, on_delete: :cascade    

    add_foreign_key :choices, :characters, on_delete: :cascade
  end
end
