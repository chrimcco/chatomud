require 'mixins/slots/definition'
require 'securerandom'

class ItemTemplate < ApplicationRecord

  extend ChatoMud::Mixins::Slots::Definition

  before_validation :set_code, on: :create

  has_one :weapon_stat_template, dependent: :destroy

  has_one :missile_stat_template, dependent: :destroy

  has_one :armor_stat_template, dependent: :destroy

  has_one :shield_stat_template, dependent: :destroy

  has_one :stack, class_name: 'AmountTemplate', foreign_key: 'stackable_id', dependent: :destroy

  has_one :food, class_name: 'AmountTemplate', foreign_key: 'edible_id', dependent: :destroy

  has_one :drink, class_name: 'AmountTemplate', foreign_key: 'drinkable_id', dependent: :destroy

  has_one :inventory_template, as: :parent, dependent: :destroy, inverse_of: :parent

  has_many :items, dependent: :destroy

  serialize :kwords

  serialize :possible_slots


  validates :short_desc, :long_desc, :full_desc, :kwords, :code, presence: true

  validate :drink_cant_be_neither_food_nor_stack

  validate :food_is_always_stack

  validate :missiles_are_always_stack

  validate :missiles_cannot_be_weapons

  validate :sheaths_cannot_be_quivers_and_viceversa

  validates :code, uniqueness: true

  validates_inclusion_of :is_sheath, :is_quiver, in: [true, false]

  validates_each :possible_slots, allow_blank: true do |record, attr, values|
    values.each do |value|
      unless all_slots.include?(value)
        record.errors.add(attr, "includes the invalid slot '#{value}'")
      end
    end
  end

  validate :sheaths_and_quivers_must_have_an_inventory

  validates_associated :weapon_stat_template, :missile_stat_template, :armor_stat_template, :shield_stat_template, :stack, :food, :drink, :inventory_template, :items


  accepts_nested_attributes_for :inventory_template

  accepts_nested_attributes_for :weapon_stat_template

  private

  def is_weapon_template?
    !!weapon_stat_template
  end

  def is_melee_weapon_template?
    is_weapon_template? && !!weapon_stat_template.melee_stat_template
  end

  def is_ranged_weapon_template?
    is_weapon_template? && !!weapon_stat_template.ranged_stat_template
  end

  def drink_cant_be_neither_food_nor_stack
    errors.add(:drink, "can be neither food nor stack") if drink && (food || stack)
  end

  def food_is_always_stack
    errors.add(:food, "must always be stack") if food && !stack
  end

  def missiles_are_always_stack
    errors.add(:missile_stat_template, "must always be stack") if food && !stack
  end

  def missiles_cannot_be_weapons
    if (missile_stat_template && weapon_stat_template)
      errors.add(:missile_stat_template, "missiles cannot be weapons")
      errors.add(:weapon_stat_template, "weapons cannot be missiles")
    end
  end

  def sheaths_cannot_be_quivers_and_viceversa
    if is_quiver && is_sheath
      errors.add(:is_quiver, "sheaths cannot be quivers")
      errors.add(:is_sheath, "quivers cannot be sheaths")
    end
  end

  def sheaths_and_quivers_must_have_an_inventory
    errors.add(:inventory_template, "is required for sheath templates") if is_sheath && !inventory_template
    errors.add(:inventory_template, "is required for quiver templates") if is_quiver && !inventory_template
  end

  def set_code
    self.code = SecureRandom.hex if code.nil?
  end

end
