require 'mixins/characters/skill_set/definition'

class WeaponStat < ApplicationRecord

  extend ChatoMud::Mixins::Characters::SkillSet::Definition

  has_one :melee_stat, dependent: :destroy

  has_one :ranged_stat, dependent: :destroy

  belongs_to :item

  enum grip: [:one_handed, :two_handed, :both]

  enum skill: all_weapon_skills


  validates :item, :grip, :skill, presence: true


  validate :melee_stat_xor_ranged_stat_must_be_present

  validate :ranged_weapons_must_have_grip_both


  validates_associated :melee_stat, :ranged_stat


  private

  def melee_stat_xor_ranged_stat_must_be_present
    if melee_stat && ranged_stat
      errors.add(:melee_stat, "cannot be a ranged weapon too")
      errors.add(:ranged_stat, "cannot be a melee weapon too")
    end
    
    unless melee_stat || ranged_stat
      errors.add(:melee_stat, "either this or ranged_stat must be set")
      errors.add(:ranged_stat, "either this or melee_stat must be set")
    end
  end

  def ranged_weapons_must_have_grip_both
    if ranged_stat
      errors.add(:grip, "must be :both for ranged weapons") unless grip.to_sym == :both
    end
  end

end
