module ChatoMud

  module Actions

    class LookAt < BaseAction

      def exec
        return unless can_perform?([:unconscious])

        target = @params[:target]
        ground = set_ground 

        if ground
          controller = @character_controller.search_item_controller(target, :room)
        else
          controller = @character_controller.search_anything_controller(target)
        end
        
        return unless check_target_present(controller, ground ? "You do not see that object." : "You do not see that person or object.")

        case controller.class.name.demodulize.to_sym
          when :NpcController, :PcController
            gender = @character_controller == controller ? :personal : controller.gender
            tx(controller.full_desc(gender))
          when :ItemController
            show_details = controller.containing_inventory_controller.owner_controller == @character_controller
            tx("#{controller.short_desc} (#{controller.location(@character_controller)}):\n#{controller.full_desc(show_details)}")
          when :FurnitureController
            tx(controller.full_desc)
          else
            raise "Unknown controller class when doing 'look at'."
        end
      end

    end

  end

end
