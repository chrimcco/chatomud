module ChatoMud

  module Spawners

    module Factories

      class ArmorStatsFactory

        def initialize(server)
          @server = server
        end

        def instantiate(armor_stat_template)
          armor_stat_attributes = armor_stat_template.attributes.symbolize_keys.except(:id, :created_at, :updated_at, :item_template_id)
          armor_stat = ArmorStat.new(armor_stat_attributes)

          armor_stat
        end

      end

    end

  end

end
