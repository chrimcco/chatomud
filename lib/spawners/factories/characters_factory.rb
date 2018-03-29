module ChatoMud

  module Spawners

    module Factories

      class CharactersFactory

        def initialize(server)
          @server = server
        end

        def instantiate(character_template)
          basic_attributes = character_template.attributes.symbolize_keys.except(:id, :created_at, :updated_at, :code, :names, :noun, :short_descs, :long_desc_endings)
          character = Character.new(basic_attributes)
          
          character.inventory = Inventory.new

          character.attribute_set = @server.attribute_sets_factory.instantiate(character_template.attribute_set_template)

          character.skill_set = @server.skill_sets_factory.instantiate(character_template.skill_set_template)

          character.choice = Choice.new

          character.health = Health.new

          character
        end

      end

    end

  end

end
