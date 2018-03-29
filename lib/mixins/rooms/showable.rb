module ChatoMud

  module Mixins

    module Rooms

      module Showable

        def show(character_controller)
          [
            "#{@room.title}",
            "#{list_exits}\n",
            "#{@room.description}",
            "#{list_furnitures}",
            "#{@inventory_controller.list_inventory(:long_desc)}",
            "#{list_characters(character_controller)}"
          ].reject { |element| element.empty? }.join("\n")
        end

        def show_from_afar(character_controller, distance)
          [
            "#{list_furnitures}",
            "#{@inventory_controller.list_inventory(:long_desc)}",
            "#{list_characters(character_controller)}"
          ].reject { |element| element.empty? }.join("\n")
        end

        def list_exits
          exits = []

          connections.each do |direction, connection|
            connecting_door_controller = connection[1]
            exit = direction.to_s.light_black
            if connecting_door_controller
              exit << " (" << (connecting_door_controller.is_open? ? "open" : "closed") << " #{connecting_door_controller.short_desc})"
            end
            exits << exit
          end

          if exits.present?
            text = "Exits: #{exits.join(', ')}"
          else
            text = "Exits: none"
          end
          text
        end

      end

    end

  end

end
