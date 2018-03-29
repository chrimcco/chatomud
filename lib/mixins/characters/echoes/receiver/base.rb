require 'mixins/characters/genders/utils'
require 'mixins/slots/utils'
require 'mixins/timers/calendar/utils'

module ChatoMud

  module Mixins

    module Characters

      module Echoes

        module Receiver

          include Genders::Utils
          include Slots::Utils
          include Timers::Calendar::Utils

          def interpolate_possessive(character_controller)
            self == character_controller ? possessive(:personal) : possessive(character_controller.gender)
          end

          def interpolate_me_other(character_controller, for_me, for_others)
            self == character_controller ? for_me : for_others
          end

          def interpolate_me_others(first_character_controller, second_character_controller, for_first, for_second, for_others)
            return for_first  if self == first_character_controller
            return for_second if self == second_character_controller
            for_others
          end

          def you
            "you".magenta
          end

          def interpolate_refs(emote, emitter, prepend_at)
            text = ""
            at_found = false

            emote.each do |emote_part|
              case emote_part.keys[0]
                when :emote_text
                  text << emote_part[:emote_text]
                when :spaces
                  text << emote_part[:spaces]
                when :at
                  text << emitter.short_desc
                  at_found = true
                when :ref
                  kword = emote_part[:ref]
                  ref_type = kword[:type]
                  target   = kword[:target]
                  case ref_type
                    when '*'
                      item_controller = emitter.search_item_controller(target, :anywhere)
                      unless item_controller
                        tx("You cannot find that '#{target[:word]}'.")
                        return nil
                      end
                      text << item_controller.short_desc
                    when '~'
                      character_controller = emitter.search_character_controller(target)
                      unless character_controller
                        tx("You cannot find '#{target[:word]}'.")
                        return nil
                      end
                      text << interpolate_me_other(character_controller, you, character_controller.short_desc)
                  end
              end
            end

            text.prepend("#{emitter.short_desc} ") if prepend_at && !at_found
            text
          end

        end

      end

    end

  end

end