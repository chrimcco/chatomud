require 'mixins/slots/definition'

class CharacterOutfitter < ApplicationRecord

  extend ChatoMud::Mixins::Slots::Definition

  validate :codes_must_point_to_item_templates

  validates :code, presence: true, uniqueness: true

  serialize :item_template_codes

  private

  def valid_content?(element)
    if element.is_a?(Hash)
      element.keys.each do |key|
        unless self.class.all_slots.include?(key)
          return false unless valid_content?(key) 
        end
        return false unless valid_content?(element[key])
      end
      return true
    elsif element.is_a?(Array)
       element.each do |code|
        return false unless valid_content?(code)
       end
       return true
    elsif element.is_a?(Symbol)
      return ItemTemplate.find_by_code(element.to_s)
    end
  end

  def codes_must_point_to_item_templates
    item_template_codes.keys.each do |wloc|
      errors.add(:item_template_codes, "contains the invalid code '#{item_template_codes[wloc]}'") unless valid_content?(item_template_codes[wloc])
    end
  end

end
