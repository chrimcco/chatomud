module ChatoMud

  module Actions

    class LookIn < BaseAction

      def exec
        return unless can_perform?([:unconscious])

        target = @params[:target]
        # TODO UNUSED?:
        ground = set_ground 

        @controller = @character_controller.search_item_controller(target, :anywhere)
        @controller = @character_controller.search_furniture_controller(target) unless @controller

        return unless check_target_present(@controller, "You cannot find the '#{target[:word]}'.")

        if @controller.is_item_controller? && @controller.is_consumable?
          tx_consumable_info
          return
        end

        return unless check_is_container(@controller)

        if check_is_closable(@controller.inventory_controller, nil)
          return unless check_must_be_open(@controller.inventory_controller.lid_controller, "#{@controller.short_desc} is closed.")
        end

        return unless check_has_content(@controller.inventory_controller, "#{@controller.short_desc} is empty.")
        
        location_info = @controller.is_item_controller? ? " (#{@controller.location(@character_controller)})" : ""

        tx("#{@controller.short_desc}#{location_info} contains:\n#{@controller.inventory_controller.list_inventory(:short_desc)}")
      end

      private

      def tx_consumable_info
        if @controller.is_edible?
          tx("It is #{@controller.edible_summary}.")
          return
        end

        if @controller.is_drinkable?
          tx("It is #{@controller.drinkable_summary}.")
          return
        end
      end

    end

  end

end