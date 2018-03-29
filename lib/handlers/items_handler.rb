require 'controllers/items/item_controller'

module ChatoMud

  module Handlers

    class ItemsHandler

      def initialize(server)
        @server = server
        @item_controllers = []
      end

      def bye
        @item_controllers.each do |item_controller|
          item_controller.bye
        end
        @item_controllers.clear
      end

      def report
        text = "*** ITEMS HANDLER\n"
        text << "#{@item_controllers.size} items loaded.\n"
        text
      end

      def remove_item_controller(item_controller)
        @item_controllers.delete(item_controller)
      end

      def add_item_controller(item_controller)
        @item_controllers << item_controller
      end

    end

  end

end