class AttributeSet < ApplicationRecord
  validates :str, :con, :agi, :dex, :int, :wil, :pow,  presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }

  belongs_to :character
  validates :character,  presence: true
end
