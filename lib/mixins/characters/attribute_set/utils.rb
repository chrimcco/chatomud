module ChatoMud

  module Mixins

    module Characters

      module AttributeSet

        module Utils

          def attribute_value(attribute)
            @attribute_set.send(attribute)
          end

          def list_attributes
            text = ""
            self.class.all_attributes.each do |attribute|
              attr_value = attribute_value(attribute)
              entry = @server.attribute_bonus_referrer.find(attr_value)
              text << "#{attribute.to_s.magenta}: #{entry.label}"
              text << " (#{attr_value}/#{entry.bonus}) " # don't show this
            end
            text
          end

        end

      end

    end

  end

end