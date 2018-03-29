module ChatoMud

  module Controllers

    module Characters

      class ChoiceController

        def initialize(server, choice)
          @server = server
          @choice = choice
        end

        def set_stance(st)
          @choice.update_attributes(stance: st)
        end

        def stance_is?(st)
          stance == st
        end

        def stance
          @choice.stance.to_sym
        end

      end

    end

  end

end