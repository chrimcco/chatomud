module ChatoMud

  module Mixins

    module Slots

      module Definition

        def all_slots
          [
            :void, :wrhand, :rhand, :wlhand, :lhand, :w2hands,
            :head,
            :torso,
            :arms, :lshoulder, :rshoulder,
            :lwrist, :rwrist,
            :legs,
            :feet, :lankle, :rankle
          ]
        end

        def wield_slots
          [:w2hands, :wrhand, :wlhand]
        end

        def hand_slots
          wield_slots + [:rhand, :lhand]
        end

        def worn_slots
          all_slots - hand_slots
        end

      end

    end

  end

end