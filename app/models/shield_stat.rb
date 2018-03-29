require 'mixins/shield/definition'

class ShieldStat < ApplicationRecord

  extend ChatoMud::Mixins::Shield::Definition

  validates :item, :variant, :quality_modifier, presence: true

  enum variant: all_variants
  
  belongs_to :item

end
