require 'mixins/characters/choices/stances/utils'

module ChatoMud

  module Actions

    class Combat < BaseAction

      include Mixins::Characters::Choices::Stances::Utils

      def exec

        text  = "Melee offensive:\n"
        text << "  Totals: #{@character_controller.stats_controller.melee_offensive_capabilities_list}\n"

        offensive_percentage = offensive_percentage_for(@character_controller.choice_controller.stance)
        text << "  Base: #{@character_controller.stats_controller.base_melee_offensive_capabilities_list} * #{offensive_percentage * 100.0}%\n"

        text << "  Armor penalty: #{@character_controller.stats_controller.melee_offensive_capabilities_armor_penalty}\n"
        text << "  Dual-wield modifiers: #{@character_controller.stats_controller.dual_wield_modifiers}\n" if @character_controller.inventory_controller.is_dual_wielding?


        text << "Melee defensive:\n"
        text << "  Total: #{@character_controller.stats_controller.melee_defensive_capabilities[:total]}\n"


        mdp = @character_controller.stats_controller.melee_defensive_capabilities
        defensive_percentage = defensive_percentage_for(@character_controller.choice_controller.stance)
        text << "  Base: #{mdp[:base]} * #{defensive_percentage * 100}%\n"
        text << "  Quickness modifier: #{mdp[:quickness]}\n"
        text << "  Parry modifier: #{mdp[:parry]}\n"
        text << "  Dodge modifier: #{mdp[:dodge]}\n"
        text << "  Shield modifier: #{mdp[:shield]}\n"
        text << "  Position modifier: #{mdp[:position]}\n"


        text << "Ranged offensive:\n"
        text << "  Totals: #{@character_controller.stats_controller.ranged_offensive_capabilities_list}\n"
        text << "  Base: #{@character_controller.stats_controller.base_ranged_offensive_capabilities_list}\n"
        text << "  Armor penalty: #{@character_controller.stats_controller.ranged_offensive_capabilities_armor_penalty}\n"

        text << "Ranged defensive:\n"
        text << "  Total: #{@character_controller.stats_controller.ranged_defensive_capability}\n"
        text << "  Quickness modifier: #{@character_controller.stats_controller.defensive_quickness_modifier}\n"
        text << "  Shield modifier: #{@character_controller.stats_controller.ranged_defensive_shield_modifier}\n"
        text << "  Dodge modifier: #{@character_controller.stats_controller.defensive_dodge_modifier}\n"
        text << "  Position modifier: #{@character_controller.stats_controller.ranged_defensive_position_modifier}\n"
        
        tx(text)
      end

    end

  end

end