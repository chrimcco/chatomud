require 'mixins/items/amounts'

module ChatoMud

  module Controllers

    module Items

      module Amounts

        class DrinkController

          include Mixins::Items::Amounts

          def initialize(item_controller, drink)
            @item_controller = item_controller
            @drink = drink
          end

          def handle_consume
            # do nothing.
          end

          def current_portion_description
            case percentage
              when 0..20
                "almost out of"
              when 20..40
                "holding some"
              when 40..60
                "half full of"
              when 60..80
                "quite full of"
              when 80..99
                "mostly full of"
              when 100
                "full of"
            end
          end

          def taken_portion_description(amount)
            case percentage(amount)
              when 0..20
                "a little of the"
              when 20..40
                "some of the"
              when 40..60
                "half of the"
              when 60..80
                "a lot of the"
              when 80..99
                "almost all of the"
              when 80.100
                "all of the"
            end
          end

          def model
            @drink
          end

        end

      end

    end

  end

end
