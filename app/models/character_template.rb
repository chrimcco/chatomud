class CharacterTemplate < ApplicationRecord

  has_one :health_template, dependent: :destroy

  has_one :attribute_set_template, dependent: :destroy

  has_one :skill_set_template, dependent: :destroy

  has_one :inventory_template, as: :parent, dependent: :destroy, inverse_of: :parent

  serialize :names

  serialize :short_descs

  serialize :long_desc_endings

  enum gender: [:male, :female, :neuter]


  validates :short_desc, :long_desc, :full_desc, :code, :names, :short_descs, :long_desc_endings, :noun, presence: true

  validates :code, uniqueness: true

  validates :skill_set_template, :attribute_set_template, :health_template, presence: true

  validates_associated :health_template, :attribute_set_template, :skill_set_template, :inventory_template

end
