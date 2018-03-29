module ChatoMud

  module Mixins

    module Characters

      module Echoes

        module Receiver

          def recv_melee_attack(params)
            @assailant               = params[:assailant]
            @target                  = params[:target]
            @attack                  = params[:attack_result][:attack]
            @body_part               = params[:attack_result][:body_part]
            @miss_reason             = params[:attack_result][:miss_reason]
            @melee_weapon_controller = params[:attack_result][:melee_weapon_controller]

            if @attack.connects
              handle_connecting_attack
            else
              handle_missed_attack
            end
          end

          def handle_connecting_attack
            text  = interpolate_me_other(@assailant, "You slash ", "#{@assailant.short_desc} slashes ")
            text << interpolate_me_others(@assailant, @target, "#{@target.short_desc}", "you", "#{@target.short_desc}")
            text << " in #{@body_part}"
            if @melee_weapon_controller
              text << " with #{interpolate_possessive(@assailant)} #{@melee_weapon_controller.short_desc} "
            end
            text << "."
            tx(text)
          end

          def handle_missed_attack
            text  = interpolate_me_other(@assailant, "You slash at ", "#{@assailant.short_desc} tries to slash ")
            text << interpolate_me_others(@assailant, @target, "#{@target.short_desc} ", "#{you} ", "#{@target.short_desc} ")
            case @miss_reason
              when :stance
                text << interpolate_me_other(@assailant, "but miss", "but misses")
              when :quickness
                text << interpolate_me_other(@assailant, "but #{personal(@target.gender)} avoids it", "but you avoid it")
              when :shield
                text << interpolate_me_other(@assailant, "but #{personal(@target.gender)} blocks it", "but you block it")
              when :parry
                text << interpolate_me_other(@assailant, "but #{personal(@target.gender)} parries it", "but you parry it")
              when :dodge
                text << interpolate_me_other(@assailant, "but #{personal(@target.gender)} dodges out of the way", "but you dodge it")
              when :total_miss
                text << interpolate_me_other(@assailant, "but miss broadly", "but misses broadly")
              else
                raise 'unknown miss reason'
            end
            text << "."
            tx(text)
          end

        end

      end

    end

  end

end
