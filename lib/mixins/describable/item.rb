require 'mixins/describable/common'
require 'mixins/describable/closable'

require 'mixins/slots/utils'

module ChatoMud

  module Mixins

    # Classes including this module need a #model method which returns the entity they govern.
    module Describable

      module Item

        include Common
        include Closable
        include Slots::Utils

        def short_desc(show_consumable = false, show_stowed = false, show_loaded = false)
          text  = model.short_desc.light_green
          text << " (#{drinkable_summary})" if show_consumable && is_drinkable?
          text << " (#{edible_summary})" if show_consumable && is_edible?
          text << stack_multiplier if is_stackable?
          text << " (loaded with #{loaded_summary})" if show_loaded && is_weapon? && @weapon_stat_controller.is_ranged? && @weapon_stat_controller.ranged_stat_controller.inventory_controller.is_loaded?
          text << " (bearing #{sheath_summary})" if show_stowed && is_sheath? && @inventory_controller.has_content?
          text << " (bearing #{quiver_summary})" if show_stowed && is_quiver? && @inventory_controller.has_content?
          text
        end

        def long_desc
          text  = model.long_desc.light_green
          text << " (#{drinkable_summary})" if is_drinkable?
          text << " (#{edible_summary})"    if is_edible?
          text << stack_multiplier          if is_stackable?
          text << " (loaded with #{loaded_summary})" if is_weapon? && @weapon_stat_controller.is_ranged? && @weapon_stat_controller.ranged_stat_controller.inventory_controller.is_loaded?
          text << " (bearing #{sheath_summary})"    if is_sheath? && @inventory_controller.has_content?
          text << " (bearing #{quiver_summary})"    if is_quiver? && @inventory_controller.has_content?
          text
        end

        def full_desc(show_details=false)
          text  = "#{model.full_desc}"
          text << "\nIt is #{drinkable_summary}."          if show_details  && is_drinkable?
          text << "\nIt is #{edible_summary}."             if show_details  && is_edible?
          text << "\n#{closable_summary}"                  if is_container? && @inventory_controller.is_closable?
          text << "\nIt is bearing #{sheath_summary}."     if is_sheath? && @inventory_controller.has_content?
          text << "\nIt is bearing #{quiver_summary}."     if is_quiver? && @inventory_controller.has_content?
          text << "\nIt is loaded with #{loaded_summary}." if is_weapon? && weapon_stat_controller.is_ranged? && @weapon_stat_controller.ranged_stat_controller.inventory_controller.is_loaded?
          text << "\n"
          text
        end

        def location(character_controller)
          case container_type
            when :room
              return "on the ground"
            when :character
              owner_controller = @containing_inventory_controller.owner_controller
              pov = owner_controller == character_controller ? :personal : owner_controller.gender
              return "#{slot_description(slot, pov)}"
            when :item
              return "inside #{@containing_inventory_controller.owner_controller.short_desc}"
          end
        end

        def drinkable_summary
          return "empty" if drink_controller.is_empty?
          "#{drink_controller.current_portion_description} #{drink_controller.fluid}"
        end

        def edible_summary
          "#{food_controller.current_portion_description}"
        end

        def sheath_summary
          @inventory_controller.list_sheathed_weapon
        end

        def quiver_summary
          @inventory_controller.list_missile_controllers
        end

        def loaded_summary
          @weapon_stat_controller.ranged_stat_controller.inventory_controller.list_loaded_missile
        end

        def stack_multiplier
          @stack_controller.has_several? ? " (x#{stack_controller.current})" : ""
        end

      end

    end

  end

end