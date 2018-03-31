require 'interpreter/interpreter'

require 'controllers/base_controller'

require 'controllers/characters/stats_controller'
require 'controllers/characters/choice_controller'
require 'controllers/characters/health/health_controller'
require 'controllers/characters/position_controller'
require 'controllers/characters/combat_controller'
require 'controllers/characters/load_controller'
require 'controllers/characters/aim_controller'
require 'controllers/characters/spasms_controller'
require 'controllers/characters/walking_controller'

require 'controllers/inventories/character_inventory_controller'

require 'mixins/characters/echoes/receiver/base'
require 'mixins/characters/markers/aiming'
require 'mixins/characters/genders/utils'
require 'mixins/describable/character'
require 'mixins/characters/searcher'

module ChatoMud

  module Controllers

    module Characters

      class CharacterController < BaseController
        attr_reader :inventory_controller
        attr_reader :walking_controller
        attr_reader :stats_controller
        attr_reader :choice_controller
        attr_reader :health_controller
        attr_reader :position_controller
        attr_reader :combat_controller
        attr_reader :load_controller
        attr_reader :aim_controller
        attr_reader :spasms_controller

        attr_accessor :entity_controller

        include Mixins::Characters::Genders::Utils
        include Mixins::Characters::Searcher
        include Mixins::Characters::Echoes::Receiver
        include Mixins::Characters::Markers::Aiming
        include Mixins::Describable::Character

        attr_reader :room_controller

        def initialize(server, entity_controller, character, room_controller)
          @server = server
          @entity_controller = entity_controller
          @character = character
          room_controller.accept_character(self, false)
          @interpreter = Grammar::Interpreter.new(@server, self)
          @inventory_controller = Inventories::CharacterInventoryController.new(@server, self, @character.inventory)
          @walking_controller = WalkingController.new(@server, self)
          @stats_controller = StatsController.new(@server, self, @character.attribute_set, @character.skill_set)
          @choice_controller = ChoiceController.new(@server, @character.choice)
          @health_controller = Health::HealthController.new(@server, self, @character.health)
          @position_controller = PositionController.new(@server, self)
          @combat_controller = CombatController.new(@server, self)
          @load_controller = LoadController.new(@server, self)
          @aim_controller = AimController.new(@server, self)
          @spasms_controller = SpasmsController.new(@server, self)
          @server.characters_handler.add_character_controller(self)
        end

        def bye
          emit_leave_area
          @server.characters_handler.remove_character_controller(self)
          @room_controller.remove_character_controller(self)
          @inventory_controller.bye
          @load_controller.bye
          @walking_controller.bye
        end

        def die
          @entity_controller.possession_controller.handle_death_when_possessing
          @entity_controller.possession_controller.handle_death_when_possessed

          @room_controller.emit_action_echo('die', { emitter: self })
          @position_controller.abandon_place if @position_controller.is_accommodated?
          @position_controller.rest
          @spasms_controller.drop_carried_items if @inventory_controller.is_carrying_anything?
          corpse_controller = @server.items_spawner.spawn_corpse(self)
          @inventory_controller.dump_items_into(corpse_controller)
          @server.characters_handler.remove_character_controller(self)
          @room_controller.remove_character_controller(self)
          handle_threads_death
          @entity_controller.handle_character_death
        end

        def fall_unconscious
          @room_controller.emit_action_echo('fall_unconscious', { emitter: self })
          @position_controller.abandon_place if @position_controller.is_accommodated?
          @position_controller.rest
          @spasms_controller.drop_carried_items if @inventory_controller.is_carrying_anything?
          
          handle_threads_unconsciousness

          @position_controller.rest
        end

        def regain_consciousness
          @room_controller.emit_action_echo('regain_consciousness', { emitter: self })
        end

        def appear_in(new_room_controller, room, remove_from_containing_room)
          @room_controller.remove_character_controller(self) if remove_from_containing_room
          new_room_controller.add_character_controller(self)
          @room_controller = new_room_controller
          @character.room = room
          @character.save!
        end

        def gender
          @character.gender.to_sym
        end

        def interpret(command)
          @interpreter.exec(command)
        end

        def tx(message, vessel = false)
          @entity_controller.tx(message, vessel) if @entity_controller # npc being instantiated e.g.
        end

        # move these guys to the echoes?
        def emit_enter_area
          @room_controller.emit_echo(self, "#{short_desc} enters the area.")
        end
        def emit_leave_area
          @room_controller.emit_echo(self, "#{short_desc} leaves the area.")
        end
        def emit_disconnection
          @room_controller.emit_echo(self, "#{short_desc} has lost connection.")
        end
        def emit_reconnection
          @room_controller.emit_echo(self, "#{short_desc} has reconnected.")
        end

        def show_room
          @room_controller.show(self)
        end

        def list_wounds(gender)
          text = @health_controller.list_wounds(gender)
          if text.present?
            return "#{personal(gender)} #{to_have(gender)} suffered #{text}."
          else
            return "#{personal(gender)} #{to_be(gender)} in perfect condition."
          end
        end

        def list_inventory(gender)
          text = @inventory_controller.list_inventory(gender)
          if text.present?
            return "#{personal(gender)} #{to_be(gender)} carrying:\n#{text}"
          else
            return "#{personal(gender)} #{to_be(gender)} naked."
          end
        end

        def score
          text = "#{@character.name}, #{short_desc}\n"
          text << "#{@stats_controller.list_attributes}\n"
          text << "You are #{position_controller.position_description}.\n"
          text << "When in combat, your stance is #{@character.choice.stance.light_blue}.\n"
          text << "#{list_wounds(:personal)}\n"
          text << "You are attacking #{combat_controller.list_target}\n" if combat_controller.is_attacking?
          text << "You are being attacked by #{combat_controller.list_assailants}\n" if combat_controller.is_being_attacked?

          text
        end

        def model
          @character
        end

        private

        def handle_threads_common
          @walking_controller.bye
          @load_controller.bye
        end

        def handle_threads_death
          handle_threads_common
          @health_controller.bye
          @combat_controller.bye
        end

        def handle_threads_unconsciousness
          handle_threads_common
          @combat_controller.handle_unconsciousness
        end

      end

    end

  end

end