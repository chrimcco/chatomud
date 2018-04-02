require 'mixins/grips/definition'
require 'mixins/characters/skill_set/definition'
require 'mixins/ranges/definition'
require 'mixins/missile/definition'

class WeaponInfoController < ApplicationController

  include ChatoMud::Mixins::Grips::Definition
  
  include ChatoMud::Mixins::Characters::SkillSet::Definition

  include ChatoMud::Mixins::Ranges::Definition

  include ChatoMud::Mixins::Missile::Definition

  def info
    render json: {
      grips:          all_grips,
      melee_skills:   all_melee_weapon_skills,
      ranged_skills:  all_ranged_weapon_skills,
      missile_types:  all_missile_types,
      missile_ranges: all_ranges
    }
  end

end

