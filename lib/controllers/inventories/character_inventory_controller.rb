require 'controllers/inventories/inventory_controller'

require 'mixins/characters/inventory/wearer'
require 'mixins/characters/inventory/weapon_wielder'
require 'mixins/characters/inventory/armored'
require 'mixins/characters/inventory/holder'
require 'mixins/characters/inventory/carrier'
require 'mixins/characters/inventory/shield_user'
require 'mixins/characters/inventory/melee_weapon_wielder'
require 'mixins/characters/inventory/sheath_user'
require 'mixins/characters/inventory/ranged_weapon_wielder'
require 'mixins/characters/inventory/missile_user'
require 'mixins/characters/inventory/quiver_user'

require 'mixins/slots/definition'
require 'mixins/body_parts/definition'

require 'mixins/slots/utils'

module ChatoMud

  module Controllers

    module Inventories

      class CharacterInventoryController < InventoryController

        extend Mixins::Slots::Definition
        extend Mixins::BodyParts::Definition

        include Mixins::Slots::Utils
        include Mixins::Characters::Inventory::Wearer
        include Mixins::Characters::Inventory::Holder
        include Mixins::Characters::Inventory::Carrier
        include Mixins::Characters::Inventory::Armored
        include Mixins::Characters::Inventory::ShieldUser
        include Mixins::Characters::Inventory::WeaponWielder
        include Mixins::Characters::Inventory::MeleeWeaponWielder
        include Mixins::Characters::Inventory::SheathUser
        include Mixins::Characters::Inventory::RangedWeaponWielder
        include Mixins::Characters::Inventory::MissileUser
        include Mixins::Characters::Inventory::QuiverUser

        def accept_item(item_controller, remove_from_parent_inventory_controller)
          item_controller.set_slot(get_hold_slot(item_controller), false) if remove_from_parent_inventory_controller
          super(item_controller, remove_from_parent_inventory_controller)
        end

        def find_held_item_controller(kword)
          find_item_controller_internal(kword, held_item_controllers)
        end

        def find_wielded_item_controller(kword)
          find_item_controller_internal(kword, wielded_item_controllers)
        end

        def find_carried_item_controller(kword)
          find_item_controller_internal(kword, carried_item_controllers)
        end

        def find_worn_item_controller(kword)
          find_item_controller_internal(kword, worn_item_controllers)
        end

        def find_worn_or_wielded_item_controller(kword)
          find_item_controller_internal(kword, worn_or_wielded_item_controllers)
        end

        def find_sheath_item_controller(kword)
          find_item_controller_internal(kword, sheath_item_controllers(:any))
        end

        def find_sheathed_item_controller(kword)
          find_item_controller_internal(kword, melee_weapon_controllers(:in_sheaths))
        end

        def find_sheathable_item_controller(kword)
          find_item_controller_internal(kword, melee_weapon_controllers(:wielded))
        end

        def find_any_item_controller(kword)
          find_item_controller_internal(kword, item_controllers_ordered_by_slot)
        end

        def lockers_for(lock_controller)
          lock_controller.lockers & held_item_controllers.map(&:model)
        end

        def list_inventory(gender)
          text = ''
          text << list_inventory_internal(self.class.hand_slots, gender)
          text << "\n"
          text << list_inventory_internal(self.class.worn_slots, gender)
          text
        end

        private

        def list_inventory_internal(slots, gender)
          show_details = gender == :personal
          text = ''
          slots.each do |slot|
            item_controller = find_item_controller_by_slot(slot)
            if item_controller
              text << "<#{slot_description(slot, gender)}> - #{item_controller.short_desc(show_details, true, true)}\n"
            end
          end
          text
        end

      end

    end

  end

end