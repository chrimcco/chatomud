require 'mixins/characters/genders/definition'

class Character < ApplicationRecord

  extend ChatoMud::Mixins::Characters::Genders::Definition

  before_validation :set_default_associations, on: :create

  scope :pcs, -> { where(npc: false) }

  scope :npcs, -> { where(npc: true) }


  has_one :health, dependent: :destroy

  has_one :attribute_set, dependent: :destroy

  has_one :skill_set, dependent: :destroy

  has_one :inventory, as: :parent, dependent: :destroy, inverse_of: :parent

  has_one :choice, dependent: :destroy
  
  belongs_to :player, optional: true

  belongs_to :room

  serialize :kwords

  enum gender: all_genders


  validate :pcs_must_have_a_player, :npcs_must_not_have_a_player, :only_pcs_can_be_active

  validates :short_desc, :long_desc, :full_desc, :gender, :inventory, :health, :attribute_set, :skill_set, :choice, presence: true

  validates_inclusion_of :npc, :active, in: [true, false]


  validates_associated :health, :attribute_set, :inventory, :skill_set, :choice

  private

  def pcs_must_have_a_player
    if is_pc? && !player_id
      errors.add(:player_id, "must be present for PCs")
    end
  end

  def npcs_must_not_have_a_player
    if is_npc? && player_id
      errors.add(:player_id, "cannot be present for PCs")
    end
  end

  def only_pcs_can_be_active
    if is_npc? && active
      errors.add(:active, "only valid for PCs")
    end
  end

  def is_pc?
    !npc
  end

  def is_npc?
    npc
  end

  def set_default_associations
    self.health        = Health.new
    self.inventory     = Inventory.new
    self.attribute_set = AttributeSet.new
    self.skill_set     = SkillSet.new    
    self.choice        = Choice.new
  end

end
