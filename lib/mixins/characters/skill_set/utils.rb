module ChatoMud

  module Mixins

    module Characters

      module SkillSet

        module Utils

          def list_skill_set
            text = ""
            self.class.all_skill_categories.each do |skill_category_name|
              rank = category_rank(skill_category_name)

              next if rank.unskilled?

              text << "#{skill_category_name.to_s.magenta} (#{rank.label})"
              text << " (#{rank.value} ranks, #{category_modifier(skill_category_name, false)})"
              text << " (#{dependencies_modifier(skill_category_referrer.find(skill_category_name).dependencies)} deps)"
              text << " (total #{category_modifier(skill_category_name)})"
              text << " (#{rank.rate})\n"
              skills = skill_referrer.group_by(skill_category_name)
              skills.each do |skill|
                skill_name = skill.name.to_sym
                rank = skill_rank(skill_name)
                next if rank.value == 0

                text << "  #{skill_name.to_s.light_blue} (#{rank.label})"
                text << " (#{rank.value} ranks, #{rank.bonus})"
                text << " (#{category_modifier(skill_category_name)} category)"
                text << " (#{dependencies_modifier(skill_referrer.find(skill_name).dependencies)} deps)"
                text << " (total #{skill_modifier(skill_name)})"
                text << " (#{rank.rate})\n"
              end
            end
            text
          end

          def rank_for(skill_name)
            @skill_set.send(skill_name)
          end
          alias_method :category_rank_for, :rank_for

          def category_modifier(skill_category_name, plus_attribute_bonus = true)
            skill_category_rank = category_rank(skill_category_name)
            
            result = skill_category_rank.bonus
            result += dependencies_modifier(skill_category_referrer.find(skill_category_name).dependencies) if plus_attribute_bonus
            result
          end

          def skill_modifier(skill_name)
            skill = skill_referrer.find(skill_name)
            skill_category_name = skill.skill_category.to_sym
            skill_category = skill_category_referrer.find(skill_category_name)

            category_modifier(skill_category_name) +
            skill_rank(skill_name).bonus +
            dependencies_modifier(skill.dependencies)
          end

          def category_rank(skill_category_name)
            category_rank_referrer.find(category_rate(skill_category_name), category_rank_for(skill_category_name))
          end

          def skill_rank(skill_name)
            rank_referrer.find(skill_rate(skill_name), rank_for(skill_name))
          end

          def category_rate(skill_category_name)
            rate(skill_category_referrer.find(skill_category_name).dependencies)
          end

          def skill_rate(skill_name)
            rate(skill_referrer.find(skill_name).dependencies)
          end

          private

          def dependencies_modifier(dependencies)
            dependencies.map do |dependency|
              attribute_bonus_referrer.find(attribute_value(dependency)).bonus
            end.sum
          end

          def rate(dependencies)
            attribute_values = dependencies.map do |dependency|
              attribute_value(dependency)
            end
            attribute_values_mean = (attribute_values.inject(:+) / 3.0).round

            return case attribute_values_mean
              when 1..15
                :limited
              when 16..35
                :below_average
              when 36..65
                :standard
              when 66..85
                :above_average
              when 86..100
                :plus
              else
                raise "invalid attribute values mean"
            end
          end

        end

      end

    end

  end

end
