require 'mixins/characters/choices/stances/definition'

class Choice < ApplicationRecord

  extend ChatoMud::Mixins::Characters::Choices::Stances::Definition

  enum stance: all_stances

  belongs_to :character

  validates :character, presence: true
end
