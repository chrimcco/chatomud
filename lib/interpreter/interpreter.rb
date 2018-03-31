require 'interpreter/parser'

require_all 'lib/actions/**/*.rb'

module ChatoMud

  module Grammar

    class Interpreter

      def initialize(server, character_controller)
        @server = server
        @character_controller = character_controller
        @parser = Parser.new
      end

      def exec(command)
        @character_controller.entity_controller.log(command)
        if is_possessed?
          handle_command_while_possessed(command)
          return
        end
        json = parse_and_transform(command)

        performer = is_possessing? ? possessed_character : @character_controller

        if json
          instantiate_action(performer, json)
        else
          handle_wrong_command
        end
      end

      private

      def parse_and_transform(command)
        begin
          return @parser.parse(command)
        rescue Parslet::ParseFailed => e
          return nil
        end
      end

      def instantiate_action(performer, json)
        key = json.keys[0]
        params = json[key]

        action = Actions.const_get(key.to_s.camelize).new(@server, performer, params)
        action.exec
      end

      def handle_wrong_command
        if is_possessing?
          @character_controller.tx("Huh? Won't pass it on to your prey.", true)          
        else
          @character_controller.tx("Huh?")
        end
      end

      def handle_command_while_possessed(command)
        @character_controller.tx("You'll be unable to perform any action until the presence leaves your mind.", true)
        @character_controller.entity_controller.possession_controller.possessing_controller.tx("You feel your prey struggling with '#{command}'.", true)
      end

      def possessed_character
        @character_controller.entity_controller.possession_controller.possessed_controller.character_controller
      end

      def is_possessing?
        @character_controller.entity_controller.possession_controller.is_possessing?
      end

      def is_possessed?
        @character_controller.entity_controller.possession_controller.is_possessed?
      end

    end

  end

end