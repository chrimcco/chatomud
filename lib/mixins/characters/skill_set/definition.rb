module ChatoMud

  module Mixins

    module Characters

      module SkillSet

        module Definition

          def all_rank_labels
            [
              :unskilled,
              :neophyte,
              :amateur,
              :familiar,
              :adroit,
              :master,
              :grandmaster
            ]
          end

          def all_rank_rates
            [
              :limited,
              :below_average,
              :standard,
              :above_average,
              :plus
            ]
          end
          alias_method :all_category_rank_rates, :all_rank_rates

          def all_skill_categories
            [
              :heavy_armor,
              :medium_armor,
              :light_armor,

              :light_edge,
              :medium_edge,
              :heavy_edge,

              :light_pierce,
              :medium_pierce,
              :heavy_pierce,

              :light_blunt,
              :medium_blunt,
              :heavy_blunt,

              :missile_weaponry,

              :martial,

              :athletics,
            ]
          end

          def all_skills
            all_armor_skills + all_weapon_skills + all_martial_skills + all_body_capabilities_skills
          end

          def all_skills_and_skill_categories
            all_skills + all_skill_categories
          end

          def all_weapon_skills
            [
              :dagger,
              :shortsword,

              :longsword,
              :broadsword,
              :falchion,
              :handaxe,
              :scimitar,

              :battleaxe,
              :greatsword,

              :quarterstaff,
              :warhammer,

              :club,
              :mace,
              :morningstar,

              :flail,
              :warmattock,

              :rapier,
              :stiletto,

              :javelin,
              :spear,

              :lance,

              :shortbow,
              :longbow,
              :crossbow,

              :brawl
            ]
          end

          def all_armor_skills
            [
              :plate,

              :chain,
              :scale,

              :rigid_leather,
              :soft_leather
            ]
          end

          def all_martial_skills
            [
              :parry,
              :block,
              :dual_wield,
              :throwing
            ]
          end

          def all_body_capabilities_skills
            [
              :body_development,
              :dodge
            ]
          end

          def all_skills_and_skill_categories
            all_skill_categories + all_skills
          end

        end

      end

    end

  end

end