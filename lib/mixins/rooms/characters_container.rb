module ChatoMud

  module Mixins

    module Rooms

      module CharactersContainer

        def add_character_controller(character_controller)
          @character_controllers << character_controller
        end

        def remove_character_controller(character_controller)
          @character_controllers.delete(character_controller)
        end

        def accept_character(character_controller, remove_from_containing_room)
          character_controller.appear_in(self, @room, remove_from_containing_room)
        end

        def find_character_controller(kword)
          word = kword[:word]
          index = kword[:index]
          if index
            index = index.to_i
          else
            index = 1
          end

          current_index = 0
          @character_controllers.each do |character_controller|
            if character_controller.matches_word(word)
              current_index = current_index + 1
              return character_controller if current_index == index
            end
          end
          nil
        end

        def character_count
          @character_controllers.size
        end

        def list_characters(character_controller)
          (@character_controllers - [character_controller]).map(&:long_desc).join("\n")
        end

      end

    end

  end

end
