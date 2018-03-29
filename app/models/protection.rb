require 'mixins/characters/skill_set/definition'

class Protection < ApplicationRecord
  
  extend ChatoMud::Mixins::Characters::SkillSet::Definition

  validates :level, uniqueness: true, numericality: { only_integer: true, less_than_or_equal_to: 20, greater_than_or_equal_to: 1 }

  enum skill: all_armor_skills + [:no_skill]

  validates :level, :skill, :min_maneuver_penalty, :max_maneuver_penalty, :ranged_attack_penalty, :quickness_penalty, presence: true

  validates :min_maneuver_penalty, :max_maneuver_penalty, :ranged_attack_penalty, numericality: { only_integer: true, less_than_or_equal_to: 0 }

  validates :quickness_penalty, numericality: { only_integer: true, less_than_or_equal_to: 0 }
end
