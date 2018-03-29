require 'mixins/characters/skill_set/definition'
require 'mixins/characters/attribute_set/definition'

class Skill < ApplicationRecord

  extend ChatoMud::Mixins::Characters::SkillSet::Definition
  extend ChatoMud::Mixins::Characters::AttributeSet::Definition

  validate :dependencies_are_valid

  enum name: all_skills
  validates :name, uniqueness: true

  enum skill_category: all_skill_categories

  validates :dependencies, length: { is: 3 }
  serialize :dependencies

  private

  def dependencies_are_valid
    dependencies.each do |dependency|
      errors.add(:dependencies, "invalid dependency '#{dependency}'") unless self.class.all_attributes.include?(dependency)
    end
  end

end
