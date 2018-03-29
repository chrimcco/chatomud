module ChatoMud

  module Spawners

    module Factories

      class LocksFactory

        def initialize(server)
          @server = server
        end

        def instantiate(lock_template)
          lock_attributes = lock_template.attributes.symbolize_keys.except(:id, :created_at, :updated_at, :parent_id)
          Lock.new(lock_attributes)
        end

      end

    end

  end

end
