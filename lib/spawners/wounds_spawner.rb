module ChatoMud

  module Spawners

    class WoundsSpawner

      def initialize(server)
        @server = server
      end

      def spawn_wound(npc_template, character_outfit_codes, room_controller)
        character = @server.characters_factory.instantiate(npc_template)

        attributes = { npc: true}
        attributes.merge!(describe(npc_template))

        character.assign_attributes(attributes)

        character_controller = Controllers::Characters::NpcController.new(@server, character, room_controller)

        @server.characters_outfitter.outfit(character_controller, character_outfit_codes) if character_outfit_codes

        @server.entities_handler.add_bot_controller(character_controller)

        character_controller
      end

    end

  end

end