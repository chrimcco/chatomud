require 'mixins/body_parts/definition'
require 'mixins/armor/definition'

class ArmorStatTemplate < ApplicationRecord

  extend ChatoMud::Mixins::BodyParts::Definition
  extend ChatoMud::Mixins::Armor::Definition

  validates :item_template, :level, :body_parts, :maneuver_impediment, :ranged_attack_impediment, presence: true
  validates :body_parts, length: { minimum: 1 }
  
  enum maneuver_impediment: all_maneuver_impediments

  enum ranged_attack_impediment: all_ranged_attack_impediments

  belongs_to :item_template

  serialize :body_parts
  validates_each :body_parts, allow_blank: true do |record, attr, values|
    values.each do |value|
      unless all_body_parts.include?(value)
        record.errors.add(attr, "includes the invalid body part '#{value}'")
      end
    end
  end
end
