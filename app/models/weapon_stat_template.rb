require 'mixins/characters/skill_set/definition'

class WeaponStatTemplate < ApplicationRecord

  extend ChatoMud::Mixins::Characters::SkillSet::Definition

  has_one :melee_stat_template, dependent: :destroy

  has_one :ranged_stat_template, dependent: :destroy

  belongs_to :item_template

  enum grip: [:one_handed, :two_handed, :both]

  enum skill: all_weapon_skills


  validates :item_template, :grip, :skill, presence: true

  validate :melee_stat_template_xor_ranged_stat_template_must_be_present


  validates_associated :melee_stat_template, :ranged_stat_template


  private

  def melee_stat_template_xor_ranged_stat_template_must_be_present
    if melee_stat_template && ranged_stat_template
      errors.add(:melee_stat_template, "cannot be a ranged weapon too")
      errors.add(:ranged_stat_template, "cannot be a melee weapon too")
    end
    
    unless melee_stat_template || ranged_stat_template
      errors.add(:melee_stat_template, "either this or ranged_stat_template must be set")
      errors.add(:ranged_stat_template, "either this or melee_stat_template must be set")
    end
  end
end
