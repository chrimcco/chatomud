module ChatoMud

  module Mixins

    module Directions

      module Utils

        def abbreviature(direction)
          case direction
            when :north
              'n'
            when :northeast
              'ne'
            when :east
              'e'
            when :southeast
              'se'
            when :south
              's'
            when :southwest
              'sw'
            when :west
              'w'
            when :northwest
              'nw'
            when :up
              'u'
            when :down
              'd'
            when nil
              return nil
            else
              raise 'unknown direction'
          end
        end

        def opposite_as_from(direction)
          case direction
            when :north
              'the south'
            when :northeast
              'the northeast'
            when :east
              'the west'
            when :southeast
              'the southeast'
            when :south
              'the north'
            when :southwest
              'the southwest'
            when :west
              'the east'
            when :northwest
              'the northwest'
            when :up
              'below'
            when :down
              'above'
            when nil
              return nil
            else
              raise 'unknown direction'
          end
        end

      end

    end

  end

end