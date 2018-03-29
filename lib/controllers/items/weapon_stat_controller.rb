require 'controllers/items/melee_stat_controller'
require 'controllers/items/ranged_stat_controller'

module ChatoMud

  module Controllers

    module Items

      class WeaponStatController

        attr_reader :melee_stat_controller
        attr_reader :ranged_stat_controller

        def initialize(server, item_controller, weapon_stat)
          @server = server
          @item_controller = item_controller
          @weapon_stat = weapon_stat

          @melee_stat_controller  = weapon_stat.melee_stat  ? MeleeStatController.new(server, self, weapon_stat.melee_stat) : nil
          @ranged_stat_controller = weapon_stat.ranged_stat ? RangedStatController.new(server, self, weapon_stat.ranged_stat) : nil
        end

        def is_ranged?
          !!@ranged_stat_controller
        end

        def is_melee?
          !!@melee_stat_controller
        end

        def is_one_handed?
          grip == :one_handed
        end

        def is_one_or_two_handed?
          is_one_handed? || grip == :both
        end

        def is_two_handed?
          grip == :two_handed
        end

        def hands_requirement
          return "a free hand" if is_one_or_two_handed?
          return "both hands free" if is_two_handed?
        end

        def grip
          @weapon_stat.grip.to_sym
        end

        def skill
          @weapon_stat.skill.to_sym
        end

      end

    end

  end

end