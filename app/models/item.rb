require 'mixins/slots/definition'

class Item < ApplicationRecord

  include ChatoMud::Mixins::Slots::Definition

  extend ChatoMud::Mixins::Slots::Definition

  has_one :stack, class_name: 'Amount', foreign_key: 'stackable_id', dependent: :destroy

  has_one :food, class_name: 'Amount', foreign_key: 'edible_id', dependent: :destroy

  has_one :drink, class_name: 'Amount', foreign_key: 'drinkable_id', dependent: :destroy

  has_one :inventory, as: :parent, dependent: :destroy, inverse_of: :parent

  has_one :weapon_stat, dependent: :destroy

  has_one :missile_stat, dependent: :destroy

  has_one :armor_stat, dependent: :destroy

  has_one :shield_stat, dependent: :destroy

  belongs_to :containing_inventory, class_name: 'Inventory'

  belongs_to :item_template

  has_and_belongs_to_many :lockables, class_name: 'Lock'

  serialize :possible_slots

  serialize :kwords

  enum slot: all_slots


  accepts_nested_attributes_for :stack

  accepts_nested_attributes_for :food


  validates :short_desc, :long_desc, :full_desc, :slot, :item_template, presence: true

  validate :drink_cant_be_neither_food_nor_stack

  validate :food_is_always_stack

  validate :weapons_have_valid_grip_slot

  validate :sheaths_hold_only_one_sheathable_weapon

  validate :weapons_sheaths_and_quivers_cannot_be_stack

  validate :sheaths_cannot_be_quivers_and_viceversa

  validate :sheaths_and_quivers_must_have_an_inventory

  validate :missiles_cannot_be_weapons

  validate :missiles_are_always_stack

  validates_inclusion_of :is_sheath, :is_quiver, in: [true, false]

  validate :slot_is_valid

  validate :possible_slots_must_not_include_void_and_hands

  validates_each :possible_slots, allow_blank: true do |record, attr, values|
    values.each do |value|
      unless all_slots.include?(value)
        record.errors.add(attr, "includes the invalid slot '#{value}'") 
      end
    end
  end


  validates_associated :stack, :food, :drink, :inventory, :weapon_stat, :missile_stat, :armor_stat, :shield_stat


  def is_weapon?
    !!weapon_stat
  end

  def is_melee_weapon?
    is_weapon? && !!weapon_stat.melee_stat
  end

  def is_ranged_weapon?
    is_weapon? && !!weapon_stat.ranged_stat
  end

  def is_missile?
    !!missile_stat
  end

  def is_wielded_two_hands?
    slot.to_sym == :w2hands
  end

  def is_wielded_one_handed?
    slot.to_sym == :wrhand || slot.to_sym == :wlhand
  end

  private

  def void_plus_hand_slots
    [:void] + hand_slots
  end

  def possible_slots_plus_void_plus_hands
    possible_slots + void_plus_hand_slots
  end

  def slot_is_valid
    errors.add(:slot, "not valid for this item") unless possible_slots_plus_void_plus_hands.include?(slot.to_sym)
  end

  def possible_slots_must_not_include_void_and_hands
    errors.add(:possible_slots, "void and hand slots are not allowed") if (void_plus_hand_slots & possible_slots).any?
  end

  def weapons_have_valid_grip_slot
    return unless is_weapon?
    errors.add(:slot, 'can only be wielded with one hand') if is_wielded_two_hands? && weapon_stat.one_handed?
    errors.add(:slot, 'can only be wielded with two hands') if is_wielded_one_handed? && weapon_stat.two_handed?
  end

  def weapons_sheaths_and_quivers_cannot_be_stack
    errors.add(:weapon_stat, 'cannot be stack') if weapon_stat && stack
    errors.add(:is_sheath, 'cannot be stack') if is_sheath && stack
    errors.add(:is_quiver, 'cannot be stack') if is_quiver && stack
  end

  def drink_cant_be_neither_food_nor_stack
    errors.add(:drink, "can be neither food nor stack") if drink && (food || stack)
  end

  def food_is_always_stack
    errors.add(:food, "must always be stack") if food && !stack
  end

  def missiles_are_always_stack
    errors.add(:missile_stat, "must always be stack") if missile_stat && !stack
  end

  def missiles_cannot_be_weapons
    if (missile_stat && weapon_stat)
      errors.add(:missile_stat, "missiles cannot be weapons")
      errors.add(:weapon_stat, "weapons cannot be missiles")
    end
  end

  def sheaths_cannot_be_quivers_and_viceversa
    if is_sheath && is_quiver
      errors.add(:is_quiver, "sheaths cannot be quivers")
      errors.add(:is_sheath, "quivers cannot be sheaths")
    end
  end

  def sheaths_and_quivers_must_have_an_inventory
    errors.add(:inventory, "is required for sheaths") if is_sheath && !inventory
    errors.add(:inventory, "is required for quivers") if is_quiver && !inventory
  end

  def sheaths_hold_only_one_sheathable_weapon
    return unless is_sheath

    items = inventory.items

    errors.add(:inventory, "sheath inventories can hold only one item") if items.length > 1

    item = items[0]
    if item
      errors.add(:inventory, "sheath inventories can only hold sheathable weapons") unless item.is_melee_weapon?
    end
  end

end
