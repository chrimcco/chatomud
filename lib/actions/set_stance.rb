require 'mixins/characters/choices/stances/definition'

module ChatoMud

  module Actions

    class SetStance < BaseAction

      extend Mixins::Characters::Choices::Stances::Definition

      def exec
        return unless can_perform?([:unconscious])

        stance = @params[:stance].to_sym

        unless self.class.all_stances.include?(stance)
          tx("'#{stance}' is not a valid stance.")
          return
        end

        if @character_controller.choice_controller.stance_is?(stance)
          tx("You are already in that stance.")
          return
        end

        @character_controller.choice_controller.set_stance(stance)
        tx("Your shift your stance to #{stance.to_s.light_blue}.")

        @character_controller.combat_controller.handle_become_pacifist if @character_controller.choice_controller.stance_is?(:pacifist)
        @character_controller.combat_controller.handle_become_belligerent unless @character_controller.choice_controller.stance_is?(:pacifist)
      end

    end

  end

end