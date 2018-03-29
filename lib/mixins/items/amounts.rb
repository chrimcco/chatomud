module ChatoMud

  module Mixins

    module Items

      # Classes including this module need a #model method which returns the amount they govern.
      module Amounts

        def current
          model.current
        end

        def max
          model.max
        end

        def set_to_max
          model.current = model.max
        end

        def is_full?
          model.current == model.max
        end

        def is_empty?
          model.current == 0
        end

        def has_some?
          model.current > 0
        end

        def has_several?
          model.current > 1
        end

        def consume(amount)
          model.current = model.current - amount
          handle_consume
          model.save!
        end

        def has_at_least?(amount)
          model.current >= amount
        end

        def fluid
          model.fluid.send(fluid_color)
        end

        def percentage(amount = :unspecified)
          amount = model.current if amount == :unspecified
          ((amount.to_f / model.max) * 100).to_i
        end

        private

        def fluid_color
          return :blue          if model.water?
          return :light_yellow  if model.beer?
          return :light_magenta if model.wine?
          return :light_black   if model.oil?
        end

      end

    end

  end

end