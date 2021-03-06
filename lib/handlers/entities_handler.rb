require 'controllers/entities/player_controller'
require 'controllers/entities/bot_controller'

#TODO add logging (inherited from server?)

module ChatoMud

  module Handlers

    class EntitiesHandler

      def initialize(server)
        @server = server
        @entity_controllers = []
      end

      def bye
        player_controllers.each do |player_controller|
          player_controller.bye(true)
        end
        bot_controllers.each do |bot_controller|
          bot_controller.bye
        end

        @entity_controllers.clear
      end

      def load_bots
        Character.npcs.each do |npc|
          npc_controller = Controllers::Characters::NpcController.new(@server, npc, @server.rooms_handler.find(npc.room.id))
          add_bot_controller(npc_controller)
        end
      end

      def report
        text = "*** ENTITIES HANDLER\n"
        text << "#{player_controllers.size} connections.\n"
        text << "#{logged_in_player_controllers.size} logged in players (#{dead_link_player_controllers.size} deadlink).\n"
        text << "#{bot_controllers.size} bots.\n"
        text
      end

      def add_player_controller(socket)
        Rails.logger.info("New connection from #{socket.human_address}")
        Thread.new(@server, socket) do |server, socket|
          player_controller = Controllers::Entities::PlayerController.new(server, Thread.current, socket)
          player_controller.process
        end
      end

      def add_bot_controller(npc_controller)
        Rails.logger.info("Loading bot.")
        Thread.new(@server, npc_controller) do |server, npc_controller|
          bot_controller = Controllers::Entities::BotController.new(server, Thread.current, npc_controller)
          bot_controller.process
        end
      end

      def add_entity_controller(entity_controller)
        @entity_controllers << entity_controller
      end

      def remove_entity_controller(entity_controller)
        @entity_controllers.delete(entity_controller)
      end

      def check_duplicate(player_controller, socket)
        previous = player_controllers.select do |another_player_controller|
          another_player_controller != player_controller &&
          another_player_controller.player_available? &&
          another_player_controller.id == player_controller.id
        end
        
        # TODO check here if previous.count > 0 => should be impossible, so log it.

        if previous[0]
          remove_entity_controller(player_controller)
          return previous[0].handle_reconnection(socket)
        else
          return :not_duplicate
        end
      end

      private

      def player_controllers
        @entity_controllers.select { |entity_controller| entity_controller.is_player? }
      end

      def bot_controllers
        @entity_controllers.select { |entity_controller| entity_controller.is_bot? }
      end

      def dead_link_player_controllers
        player_controllers.select { |player_controller| player_controller.is_waiting_for_reconnection? }
      end

      def logged_in_player_controllers
        player_controllers.select { |player_controller| player_controller.is_logged_in? }
      end

    end

  end

end