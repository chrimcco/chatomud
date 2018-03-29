# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160101090000) do

  create_table "amount_templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "current", null: false
    t.integer "max", null: false
    t.integer "fluid", default: 0, null: false
    t.bigint "stackable_id"
    t.bigint "edible_id"
    t.bigint "drinkable_id"
    t.index ["drinkable_id"], name: "index_amount_templates_on_drinkable_id"
    t.index ["edible_id"], name: "index_amount_templates_on_edible_id"
    t.index ["stackable_id"], name: "index_amount_templates_on_stackable_id"
  end

  create_table "amounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "current", null: false
    t.integer "max", null: false
    t.integer "fluid", default: 0, null: false
    t.bigint "stackable_id"
    t.bigint "edible_id"
    t.bigint "drinkable_id"
    t.index ["drinkable_id"], name: "index_amounts_on_drinkable_id"
    t.index ["edible_id"], name: "index_amounts_on_edible_id"
    t.index ["stackable_id"], name: "index_amounts_on_stackable_id"
  end

  create_table "armor_stat_templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "item_template_id"
    t.integer "level", null: false
    t.integer "maneuver_impediment", null: false
    t.integer "ranged_attack_impediment", null: false
    t.string "body_parts", default: "--- []\n", null: false
    t.index ["item_template_id"], name: "index_armor_stat_templates_on_item_template_id"
  end

  create_table "armor_stats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "item_id"
    t.integer "level", null: false
    t.integer "maneuver_impediment", null: false
    t.integer "ranged_attack_impediment", null: false
    t.string "body_parts", default: "--- []\n", null: false
    t.index ["item_id"], name: "index_armor_stats_on_item_id"
  end

  create_table "attacks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "connects", default: true
    t.integer "score_limit", null: false
    t.integer "skill", null: false
    t.integer "against", null: false
    t.integer "hits", null: false
    t.integer "critical_severity", null: false
    t.integer "critical_type", null: false
  end

  create_table "attribute_bonus", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "limit", null: false
    t.integer "bonus", null: false
    t.string "label", null: false
  end

  create_table "attribute_set_templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "character_template_id", null: false
    t.string "preference", default: "--- []\n", null: false
    t.index ["character_template_id"], name: "index_attribute_set_templates_on_character_template_id"
  end

  create_table "attribute_sets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "character_id", null: false
    t.integer "str", null: false
    t.integer "con", null: false
    t.integer "agi", null: false
    t.integer "dex", null: false
    t.integer "int", null: false
    t.integer "wil", null: false
    t.integer "pow", null: false
    t.index ["character_id"], name: "index_attribute_sets_on_character_id"
  end

  create_table "category_ranks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "rate", default: 0, null: false
    t.integer "value", null: false
    t.integer "bonus", null: false
    t.integer "label", default: 0, null: false
  end

  create_table "character_outfitters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "item_template_codes", null: false
    t.string "code", null: false
  end

  create_table "character_templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "short_desc", null: false
    t.string "long_desc", null: false
    t.text "full_desc", null: false
    t.string "code", null: false
    t.string "names", null: false
    t.string "noun", null: false
    t.string "short_descs", null: false
    t.string "long_desc_endings", null: false
    t.integer "gender", default: 0, null: false
  end

  create_table "characters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "short_desc", null: false
    t.string "long_desc", null: false
    t.text "full_desc", null: false
    t.string "kwords"
    t.boolean "npc", default: false
    t.boolean "active", default: false
    t.integer "gender", default: 0, null: false
    t.bigint "player_id"
    t.bigint "room_id", null: false
    t.index ["player_id"], name: "index_characters_on_player_id"
    t.index ["room_id"], name: "index_characters_on_room_id"
  end

  create_table "choices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "stance", default: 3, null: false
    t.bigint "character_id", null: false
    t.index ["character_id"], name: "index_choices_on_character_id"
  end

  create_table "criticals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "damage_type", null: false
    t.integer "severity", null: false
    t.integer "score_limit", null: false
    t.integer "extra_hits", null: false
    t.integer "blood_loss", null: false
    t.integer "attack_stun_type", null: false
    t.integer "attack_stun_rounds", null: false
    t.integer "attack_stun_penalty", null: false
    t.integer "parry_stun_type", null: false
    t.integer "parry_stun_rounds", null: false
    t.integer "parry_stun_penalty", null: false
    t.string "message", null: false
    t.index ["damage_type", "severity", "score_limit"], name: "index_criticals_on_damage_type_and_severity_and_score_limit"
  end

  create_table "doors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "short_desc", null: false
    t.string "long_desc", null: false
    t.text "full_desc", null: false
    t.boolean "open", default: false, null: false
    t.boolean "see_through", default: false, null: false
    t.bigint "nr_id"
    t.bigint "ner_id"
    t.bigint "er_id"
    t.bigint "ser_id"
    t.bigint "sr_id"
    t.bigint "swr_id"
    t.bigint "wr_id"
    t.bigint "nwr_id"
    t.bigint "ur_id"
    t.bigint "dr_id"
    t.index ["dr_id"], name: "index_doors_on_dr_id"
    t.index ["er_id"], name: "index_doors_on_er_id"
    t.index ["ner_id"], name: "index_doors_on_ner_id"
    t.index ["nr_id"], name: "index_doors_on_nr_id"
    t.index ["nwr_id"], name: "index_doors_on_nwr_id"
    t.index ["ser_id"], name: "index_doors_on_ser_id"
    t.index ["sr_id"], name: "index_doors_on_sr_id"
    t.index ["swr_id"], name: "index_doors_on_swr_id"
    t.index ["ur_id"], name: "index_doors_on_ur_id"
    t.index ["wr_id"], name: "index_doors_on_wr_id"
  end

  create_table "furniture_templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "short_desc", null: false
    t.string "long_desc", null: false
    t.text "full_desc", null: false
    t.string "kwords", default: "--- []\n", null: false
    t.string "code", null: false
    t.integer "max_seats", default: 0, null: false
  end

  create_table "furnitures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "short_desc", null: false
    t.string "long_desc", null: false
    t.text "full_desc", null: false
    t.string "kwords", default: "--- []\n", null: false
    t.integer "max_seats", default: 0, null: false
    t.bigint "room_id", null: false
    t.bigint "furniture_template_id", null: false
    t.index ["furniture_template_id"], name: "index_furnitures_on_furniture_template_id"
    t.index ["room_id"], name: "index_furnitures_on_room_id"
  end

  create_table "health_templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "character_template_id", null: false
    t.index ["character_template_id"], name: "index_health_templates_on_character_template_id"
  end

  create_table "healths", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "character_id", null: false
    t.index ["character_id"], name: "index_healths_on_character_id"
  end

  create_table "inventories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "parent_type"
    t.bigint "parent_id", null: false
    t.index ["parent_type", "parent_id"], name: "index_inventories_on_parent_type_and_parent_id"
  end

  create_table "inventory_templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "parent_type"
    t.bigint "parent_id", null: false
    t.index ["parent_type", "parent_id"], name: "index_inventory_templates_on_parent_type_and_parent_id"
  end

  create_table "item_outfitters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "item_template_codes", null: false
    t.string "code", null: false
  end

  create_table "item_templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "short_desc", null: false
    t.string "long_desc", null: false
    t.text "full_desc", null: false
    t.string "kwords", default: "--- []\n", null: false
    t.string "code", null: false
    t.boolean "is_sheath", default: false
    t.boolean "is_quiver", default: false
    t.string "possible_slots", default: "--- []\n", null: false
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "short_desc", null: false
    t.string "long_desc", null: false
    t.text "full_desc", null: false
    t.string "kwords", default: "--- []\n", null: false
    t.string "possible_slots", default: "--- []\n", null: false
    t.integer "slot", default: 0, null: false
    t.boolean "is_sheath", default: false
    t.boolean "is_quiver", default: false
    t.bigint "containing_inventory_id", null: false
    t.bigint "item_template_id", null: false
    t.index ["containing_inventory_id"], name: "index_items_on_containing_inventory_id"
    t.index ["item_template_id"], name: "index_items_on_item_template_id"
  end

  create_table "items_locks", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "item_id", null: false
    t.bigint "lock_id", null: false
    t.index ["item_id"], name: "index_items_locks_on_item_id"
    t.index ["lock_id"], name: "index_items_locks_on_lock_id"
  end

  create_table "lid_templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "inventory_template_id", null: false
    t.index ["inventory_template_id"], name: "index_lid_templates_on_inventory_template_id"
  end

  create_table "lids", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "open", default: false, null: false
    t.bigint "inventory_id", null: false
    t.index ["inventory_id"], name: "index_lids_on_inventory_id"
  end

  create_table "lock_templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "parent_type"
    t.bigint "parent_id", null: false
    t.index ["parent_type", "parent_id"], name: "index_lock_templates_on_parent_type_and_parent_id"
  end

  create_table "locks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "locked", default: true, null: false
    t.string "parent_type"
    t.bigint "parent_id", null: false
    t.index ["parent_type", "parent_id"], name: "index_locks_on_parent_type_and_parent_id"
  end

  create_table "melee_stat_templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "weapon_stat_template_id"
    t.string "sheathed_desc"
    t.index ["weapon_stat_template_id"], name: "index_melee_stat_templates_on_weapon_stat_template_id"
  end

  create_table "melee_stats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "weapon_stat_id"
    t.string "sheathed_desc"
    t.index ["weapon_stat_id"], name: "index_melee_stats_on_weapon_stat_id"
  end

  create_table "missile_stat_templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "item_template_id"
    t.integer "missile_type", default: 0, null: false
    t.index ["item_template_id"], name: "index_missile_stat_templates_on_item_template_id"
  end

  create_table "missile_stats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "item_id"
    t.integer "missile_type", default: 0, null: false
    t.index ["item_id"], name: "index_missile_stats_on_item_id"
  end

  create_table "players", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "username", null: false
    t.string "password_digest", null: false
  end

  create_table "protections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "level", null: false
    t.integer "skill", null: false
    t.integer "min_maneuver_penalty", null: false
    t.integer "max_maneuver_penalty", null: false
    t.integer "ranged_attack_penalty", null: false
    t.integer "quickness_penalty", null: false
  end

  create_table "ranged_stat_templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "weapon_stat_template_id"
    t.integer "missile_type", default: 0, null: false
    t.string "ranges_suitability", default: "--- []\n", null: false
    t.boolean "can_remain_loaded", default: false
    t.index ["weapon_stat_template_id"], name: "index_ranged_stat_templates_on_weapon_stat_template_id"
  end

  create_table "ranged_stats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "weapon_stat_id"
    t.integer "missile_type", default: 0, null: false
    t.string "ranges_suitability", default: "--- []\n", null: false
    t.boolean "can_remain_loaded", default: false
    t.index ["weapon_stat_id"], name: "index_ranged_stats_on_weapon_stat_id"
  end

  create_table "ranks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "rate", default: 0, null: false
    t.integer "value", null: false
    t.integer "bonus", null: false
    t.integer "label", default: 0, null: false
  end

  create_table "rooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.bigint "nr_id"
    t.bigint "ner_id"
    t.bigint "er_id"
    t.bigint "ser_id"
    t.bigint "sr_id"
    t.bigint "swr_id"
    t.bigint "wr_id"
    t.bigint "nwr_id"
    t.bigint "ur_id"
    t.bigint "dr_id"
    t.bigint "nd_id"
    t.bigint "ned_id"
    t.bigint "ed_id"
    t.bigint "sed_id"
    t.bigint "sd_id"
    t.bigint "swd_id"
    t.bigint "wd_id"
    t.bigint "nwd_id"
    t.bigint "ud_id"
    t.bigint "dd_id"
    t.index ["dd_id"], name: "index_rooms_on_dd_id"
    t.index ["dr_id"], name: "index_rooms_on_dr_id"
    t.index ["ed_id"], name: "index_rooms_on_ed_id"
    t.index ["er_id"], name: "index_rooms_on_er_id"
    t.index ["nd_id"], name: "index_rooms_on_nd_id"
    t.index ["ned_id"], name: "index_rooms_on_ned_id"
    t.index ["ner_id"], name: "index_rooms_on_ner_id"
    t.index ["nr_id"], name: "index_rooms_on_nr_id"
    t.index ["nwd_id"], name: "index_rooms_on_nwd_id"
    t.index ["nwr_id"], name: "index_rooms_on_nwr_id"
    t.index ["sd_id"], name: "index_rooms_on_sd_id"
    t.index ["sed_id"], name: "index_rooms_on_sed_id"
    t.index ["ser_id"], name: "index_rooms_on_ser_id"
    t.index ["sr_id"], name: "index_rooms_on_sr_id"
    t.index ["swd_id"], name: "index_rooms_on_swd_id"
    t.index ["swr_id"], name: "index_rooms_on_swr_id"
    t.index ["ud_id"], name: "index_rooms_on_ud_id"
    t.index ["ur_id"], name: "index_rooms_on_ur_id"
    t.index ["wd_id"], name: "index_rooms_on_wd_id"
    t.index ["wr_id"], name: "index_rooms_on_wr_id"
  end

  create_table "settings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "ansi_coloring", default: false
    t.bigint "player_id", null: false
    t.index ["player_id"], name: "index_settings_on_player_id"
  end

  create_table "shield_stat_templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "item_template_id"
    t.integer "variant", default: 0, null: false
    t.integer "quality_modifier", default: 0, null: false
    t.index ["item_template_id"], name: "index_shield_stat_templates_on_item_template_id"
  end

  create_table "shield_stats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "item_id"
    t.integer "variant", default: 0, null: false
    t.integer "quality_modifier", default: 0, null: false
    t.index ["item_id"], name: "index_shield_stats_on_item_id"
  end

  create_table "skill_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "name", null: false
    t.string "dependencies", default: "--- []\n", null: false
  end

  create_table "skill_set_templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "character_template_id", null: false
    t.string "chosen", default: "--- []\n", null: false
    t.index ["character_template_id"], name: "index_skill_set_templates_on_character_template_id"
  end

  create_table "skill_sets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "character_id", null: false
    t.integer "heavy_armor", null: false
    t.integer "medium_armor", null: false
    t.integer "light_armor", null: false
    t.integer "light_edge", null: false
    t.integer "medium_edge", null: false
    t.integer "heavy_edge", null: false
    t.integer "light_pierce", null: false
    t.integer "medium_pierce", null: false
    t.integer "heavy_pierce", null: false
    t.integer "light_blunt", null: false
    t.integer "medium_blunt", null: false
    t.integer "heavy_blunt", null: false
    t.integer "missile_weaponry", null: false
    t.integer "martial", null: false
    t.integer "athletics", null: false
    t.integer "plate", null: false
    t.integer "scale", null: false
    t.integer "chain", null: false
    t.integer "soft_leather", null: false
    t.integer "rigid_leather", null: false
    t.integer "dagger", null: false
    t.integer "shortsword", null: false
    t.integer "longsword", null: false
    t.integer "broadsword", null: false
    t.integer "falchion", null: false
    t.integer "handaxe", null: false
    t.integer "scimitar", null: false
    t.integer "battleaxe", null: false
    t.integer "greatsword", null: false
    t.integer "quarterstaff", null: false
    t.integer "warhammer", null: false
    t.integer "club", null: false
    t.integer "mace", null: false
    t.integer "morningstar", null: false
    t.integer "flail", null: false
    t.integer "warmattock", null: false
    t.integer "rapier", null: false
    t.integer "stiletto", null: false
    t.integer "javelin", null: false
    t.integer "spear", null: false
    t.integer "lance", null: false
    t.integer "shortbow", null: false
    t.integer "longbow", null: false
    t.integer "crossbow", null: false
    t.integer "block", null: false
    t.integer "parry", null: false
    t.integer "dual_wield", null: false
    t.integer "throw", null: false
    t.integer "brawl", null: false
    t.integer "body_development", null: false
    t.integer "dodge", null: false
    t.index ["character_id"], name: "index_skill_sets_on_character_id"
  end

  create_table "skills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "name", null: false
    t.integer "skill_category", null: false
    t.string "dependencies", default: "--- []\n", null: false
  end

  create_table "weapon_stat_templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "item_template_id"
    t.integer "grip", default: 0, null: false
    t.integer "skill", null: false
    t.index ["item_template_id"], name: "index_weapon_stat_templates_on_item_template_id"
  end

  create_table "weapon_stats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "item_id"
    t.integer "grip", default: 0, null: false
    t.integer "skill", null: false
    t.index ["item_id"], name: "index_weapon_stats_on_item_id"
  end

  create_table "wounds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "damage", null: false
    t.integer "damage_type", null: false
    t.integer "body_part", null: false
    t.bigint "health_id", null: false
    t.index ["health_id"], name: "index_wounds_on_health_id"
  end

  add_foreign_key "amount_templates", "item_templates", column: "drinkable_id", on_delete: :cascade
  add_foreign_key "amount_templates", "item_templates", column: "edible_id", on_delete: :cascade
  add_foreign_key "amount_templates", "item_templates", column: "stackable_id", on_delete: :cascade
  add_foreign_key "amounts", "items", column: "drinkable_id", on_delete: :cascade
  add_foreign_key "amounts", "items", column: "edible_id", on_delete: :cascade
  add_foreign_key "amounts", "items", column: "stackable_id", on_delete: :cascade
  add_foreign_key "armor_stat_templates", "item_templates", on_delete: :cascade
  add_foreign_key "armor_stats", "items", on_delete: :cascade
  add_foreign_key "attribute_set_templates", "character_templates", on_delete: :cascade
  add_foreign_key "attribute_sets", "characters", on_delete: :cascade
  add_foreign_key "characters", "players", on_delete: :cascade
  add_foreign_key "characters", "rooms"
  add_foreign_key "choices", "characters", on_delete: :cascade
  add_foreign_key "doors", "rooms", column: "dr_id"
  add_foreign_key "doors", "rooms", column: "er_id"
  add_foreign_key "doors", "rooms", column: "ner_id"
  add_foreign_key "doors", "rooms", column: "nr_id"
  add_foreign_key "doors", "rooms", column: "nwr_id"
  add_foreign_key "doors", "rooms", column: "ser_id"
  add_foreign_key "doors", "rooms", column: "sr_id"
  add_foreign_key "doors", "rooms", column: "swr_id"
  add_foreign_key "doors", "rooms", column: "ur_id"
  add_foreign_key "doors", "rooms", column: "wr_id"
  add_foreign_key "furnitures", "rooms"
  add_foreign_key "health_templates", "character_templates", on_delete: :cascade
  add_foreign_key "healths", "characters", on_delete: :cascade
  add_foreign_key "items", "inventories", column: "containing_inventory_id", on_delete: :cascade
  add_foreign_key "items", "item_templates", on_delete: :cascade
  add_foreign_key "items_locks", "items", on_delete: :cascade
  add_foreign_key "items_locks", "locks", on_delete: :cascade
  add_foreign_key "lid_templates", "inventory_templates", on_delete: :cascade
  add_foreign_key "lids", "inventories", on_delete: :cascade
  add_foreign_key "melee_stat_templates", "weapon_stat_templates", on_delete: :cascade
  add_foreign_key "melee_stats", "weapon_stats", on_delete: :cascade
  add_foreign_key "missile_stat_templates", "item_templates", on_delete: :cascade
  add_foreign_key "missile_stats", "items", on_delete: :cascade
  add_foreign_key "ranged_stat_templates", "weapon_stat_templates", on_delete: :cascade
  add_foreign_key "ranged_stats", "weapon_stats", on_delete: :cascade
  add_foreign_key "rooms", "doors", column: "dd_id"
  add_foreign_key "rooms", "doors", column: "ed_id"
  add_foreign_key "rooms", "doors", column: "nd_id"
  add_foreign_key "rooms", "doors", column: "ned_id"
  add_foreign_key "rooms", "doors", column: "nwd_id"
  add_foreign_key "rooms", "doors", column: "sd_id"
  add_foreign_key "rooms", "doors", column: "sed_id"
  add_foreign_key "rooms", "doors", column: "swd_id"
  add_foreign_key "rooms", "doors", column: "ud_id"
  add_foreign_key "rooms", "doors", column: "wd_id"
  add_foreign_key "rooms", "rooms", column: "dr_id"
  add_foreign_key "rooms", "rooms", column: "er_id"
  add_foreign_key "rooms", "rooms", column: "ner_id"
  add_foreign_key "rooms", "rooms", column: "nr_id"
  add_foreign_key "rooms", "rooms", column: "nwr_id"
  add_foreign_key "rooms", "rooms", column: "ser_id"
  add_foreign_key "rooms", "rooms", column: "sr_id"
  add_foreign_key "rooms", "rooms", column: "swr_id"
  add_foreign_key "rooms", "rooms", column: "ur_id"
  add_foreign_key "rooms", "rooms", column: "wr_id"
  add_foreign_key "settings", "players", on_delete: :cascade
  add_foreign_key "shield_stat_templates", "item_templates", on_delete: :cascade
  add_foreign_key "shield_stats", "items", on_delete: :cascade
  add_foreign_key "skill_set_templates", "character_templates", on_delete: :cascade
  add_foreign_key "skill_sets", "characters", on_delete: :cascade
  add_foreign_key "weapon_stat_templates", "item_templates", on_delete: :cascade
  add_foreign_key "weapon_stats", "items", on_delete: :cascade
  add_foreign_key "wounds", "healths", on_delete: :cascade
end
