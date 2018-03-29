require_all 'lib/mixins/actions/**/*.rb'

module ChatoMud

  module Actions

    class BaseAction

      include Mixins::Actions::Checks::Amounts
      include Mixins::Actions::Checks::Closable
      include Mixins::Actions::Checks::Equality
      include Mixins::Actions::Checks::General
      include Mixins::Actions::Checks::Inventories
      include Mixins::Actions::Checks::Lockable
      include Mixins::Actions::Checks::Types
      include Mixins::Actions::Checks::Weapons

      include Mixins::Actions::Helpers::Items

      def initialize(server, character_controller, params)
        @server = server
        @character_controller = character_controller
        @params = params
      end

      def min_amount(default_amount)
        @params[:amount] ? @params[:amount].to_i : default_amount
      end

      def set_direction
        @params[:direction].keys[0].to_s
      end

      def set_door(direction)
        room_controller.send("door_#{direction}")
      end

      def set_ground
        !!@params[:ground]
      end

      def room_controller
        @character_controller.room_controller
      end

      def position_controller
        @character_controller.position_controller
      end

      def entity_controller
        @character_controller.entity_controller
      end

      def tx(message, vessel = false)
        @character_controller.tx(message, vessel)
      end

      # TODO there are actions that are forbidden when sitting/resting IF the item is on the ground, but allowed if on person
      # e.g. opening an item, eating/drinking, locking/unlocking.
      def can_perform?(stop_conditions)
        if (stop_conditions & [:unconscious]).any? && !@character_controller.health_controller.is_conscious?
          tx("You are unconscious.");
          return false
        end

        if (stop_conditions & [:sitting]).any? && position_controller.is_sitting?
          tx("You cannot do that while sitting.")
          return false
        end

        if (stop_conditions & [:resting]).any? && position_controller.is_resting?
          tx("You cannot do that while lying down.")
          return false
        end

        if (stop_conditions & [:sitting_or_resting]).any? && position_controller.is_sitting_or_resting?
          tx("You will need so stand up first.")
          return false
        end

        if (stop_conditions & [:in_combat]).any? && @character_controller.combat_controller.is_in_combat?
          tx("You cannot do that while fighting.")
          return false
        end

        true
      end

      def interrupt_ranged_weapon_handling
        interrupt_transient_ranged_weapon_handling
        interrupt_static_ranged_weapon_handling
      end

      def interrupt_transient_ranged_weapon_handling
        interrupt_loading || interrupt_aiming
      end

      def interrupt_static_ranged_weapon_handling
        interrupt_hold_load
      end

      def interrupt_loading
        is_loading = @character_controller.load_controller.is_loading?
        
        @character_controller.load_controller.stop_loading
        
        is_loading
      end

      def interrupt_hold_load
        interrupted = false

        if @character_controller.load_controller.is_holding_load?
          interrupted = true
          Unload.new(@server, @character_controller, nil).exec
        end

        interrupted
      end

      def interrupt_aiming
        was_aiming = @character_controller.aim_controller.is_aiming?
        
        @character_controller.aim_controller.stop_aiming
        
        was_aiming
      end


    end

  end

end