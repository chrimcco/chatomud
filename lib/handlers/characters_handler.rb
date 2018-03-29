#TODO add logging (inherited from server?)

module ChatoMud

  module Handlers

    class CharactersHandler

      def initialize(server)
        @server = server
        @character_controllers = []
      end

      def report
        text = "*** CHARACTERS HANDLER\n"
        text << "#{@character_controllers.size} characters in-game.\n"
        text << "#{pc_controllers.size} of them human-controlled.\n"
        text << "#{npc_controllers.size} of them bot-controlled.\n"
        text
      end

      def add_character_controller(character_controller)
        log.info("Adding character to main list.")
        @character_controllers << character_controller
      end

      def remove_character_controller(character_controller)
        log.info("Removing character from main list.")
        @character_controllers.delete(character_controller)
      end

      def bye
        @character_controllers.each do |character_controller|
          character_controller.bye
        end
        @character_controllers.clear
      end

      private

      def pc_controllers
        @character_controllers.select { |character_controller| character_controller.is_pc? }
      end

      def npc_controllers
        @character_controllers.select { |character_controller| character_controller.is_npc? }
      end

    end

  end

end