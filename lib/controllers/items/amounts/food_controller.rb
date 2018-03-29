require 'mixins/items/amounts'

module ChatoMud

  module Controllers

    module Items

      module Amounts

        class FoodController
          include Mixins::Items::Amounts

          def initialize(item_controller, food)
            @item_controller = item_controller
            @food = food
          end

          def handle_reduced_stack
            @food.current = @food.max
          end

          def handle_consume
            if is_empty?
              @item_controller.stack_controller.consume(1)
            end
          end

          def current_portion_description
            case percentage
              when 0..20
                "no more than a few remaining scraps"
              when 20..40
                "mostly eaten"
              when 40..60
                "half-eaten"
              when 60..80
                "partly-eaten"
              when 80..99
                "barely touched"
              when 100
                "untouched"
            end
          end

          def taken_portion_description(amount)
            case percentage(amount)
              when 0..20
                "a bite of"
              when 20..40
                "a few bites of"
              when 40..60
                "half of"
              when 60..80
                "most of"
              when 80..99
                "almost all of"
              when 100
                "all of"
            end
          end

          def model
            @food
          end

        end

      end

    end

  end

end
