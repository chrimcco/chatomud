class Health < ApplicationRecord

  belongs_to :character

  validates :character, presence: true

  has_many :wounds, dependent: :destroy
  
end

