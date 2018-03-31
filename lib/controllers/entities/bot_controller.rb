require 'controllers/entities/entity_controller'
require 'controllers/characters/npc_controller'

module ChatoMud

  module Controllers

    module Entities

      class BotController < EntityController

        def initialize(server, thread, character_controller)
          super(server, thread)
          @character_controller = character_controller
          @character_controller.entity_controller = self
          @character_controller.emit_enter_area
        end

        def process
          loop do
            #handle_command(", waves amiably.") unless @possession_controller.is_possessed?
            sleep(15)
          end
        end

        def bye
          super
        end

        def handle_character_death
          super
          bye
        end

        def tx(message, vessel = false)
          if @possession_controller.is_possessed?
            @possession_controller.possessing_controller.tx(message, true) unless vessel
          end
        end

        def is_waiting_for_reconnection?
          false
        end

        def show_prompt
          #
        end

        def is_player?
          false
        end

        def is_bot?
          true
        end

      end

    end

  end

end