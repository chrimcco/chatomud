require 'mixins/characters/skill_set/definition'

class Rank < ApplicationRecord
  
  extend ChatoMud::Mixins::Characters::SkillSet::Definition

  enum rate: all_rank_rates

  enum label: all_rank_labels

  validates :value, :bonus, :label, presence: true

  validates :value, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 30 }
end
