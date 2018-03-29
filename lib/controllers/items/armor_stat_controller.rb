module ChatoMud

  module Controllers

    module Items

      class ArmorStatController

        def initialize(server, item_controller, armor_stat)
          @server = server
          @item_controller = item_controller
          @armor_stat = armor_stat
        end

        def body_parts
          @armor_stat.body_parts
        end

        def level
          @armor_stat.level
        end

        def maneuver_impediment
          @armor_stat.maneuver_impediment.to_sym
        end

        def ranged_attack_impediment
          @armor_stat.ranged_attack_impediment.to_sym
        end

      end

    end

  end

end
