require 'mixins/shield/definition'

class ShieldStatTemplate < ApplicationRecord

  extend ChatoMud::Mixins::Shield::Definition

  validates :item_template, :variant, :quality_modifier, presence: true

  enum variant: all_variants
  
  belongs_to :item_template

end
