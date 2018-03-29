module ChatoMud

  module Actions

    class Set < BaseAction

      def exec
        return unless can_perform?([:unconscious])

        text = "stance:\n".light_blue
        text << "  pacifist\n"
        text << "  defensive\n"
        text << "  careful\n"
        text << "  normal\n"
        text << "  aggressive\n"
        text << "  frantic\n"
        text << "  frenzy\n"
        text << "e.g.: set stance aggressive\n"

        tx(text)
      end

    end

  end

end