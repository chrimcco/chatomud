require 'mixins/characters/skill_set/definition'

class SkillSetTemplate < ApplicationRecord

  extend ChatoMud::Mixins::Characters::SkillSet::Definition

  validate :choices_are_valid

  belongs_to :character_template
  validates :character_template,  presence: true

  validates :chosen, length: { minimum: 3 }
  serialize :chosen

  private

  def choices_are_valid
    chosen.each do |choice|
      errors.add(:chosen, "invalid choice '#{choice}'") unless self.class.all_skills_and_skill_categories.include?(choice)
    end
  end

end
