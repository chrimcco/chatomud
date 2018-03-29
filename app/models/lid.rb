class Lid < ApplicationRecord

  has_one :lock, as: :parent, dependent: :destroy, inverse_of: :parent

  belongs_to :inventory


  validates :inventory, presence: true

  validates_inclusion_of :open, in: [true, false]

  validate :can_be_locked_only_when_closed

  validate :can_only_belong_to_item_or_furniture_inventory


  validates_associated :lock


  def has_lock?
    !!lock
  end

  private

  def can_only_belong_to_item_or_furniture_inventory
    errors.add(:inventory, 'can only be an item inventory') unless inventory.belongs_to_item? || inventory.belongs_to_furniture?
  end

  def can_be_locked_only_when_closed
    if has_lock?
      errors.add(:lock, 'can only be locked when lid is closed') if open && lock.locked
    end
  end

end
