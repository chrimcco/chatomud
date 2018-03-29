class ItemsController < ApplicationController

  before_action :set_item, only: [:update, :destroy]

  def index
    render json: Item.all
  end

  def create
    item = Item.new(item_params)
    item.slot = :void
    item.containing_inventory = Room.second.inventory
    item.item_template = ItemTemplate.find_by_code('prest_01')
    # item = Item.new(
    #   short_desc: 'a shiny diamond',
    #   long_desc: 'A shiny diamond belongs to noone on the ground.',
    #   full_desc: 'Multifaceted and pretty.',
    #   kwords: ['diamond', 'shiny'],
    #   slot: :void,
    #   containing_inventory: Room.second.inventory,
    #   item_template: ItemTemplate.find_by_code('prest_01')
    # )
    if item.save!
      ChatoMud::Controllers::Items::ItemController.new(Server, item, Server.rooms_handler.find(Room.second.id).inventory_controller)
      render json: item
    else
      render json: { errors: item.errors.messages }, status: :unprocessable_entity
    end
  end

  def update
    if @item.update_attributes(item_params)
      render json: @item
    else
      render json: { errors: @item.errors.messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy

    head :no_content
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:short_desc, :long_desc, :full_desc, kwords: [])
  end

end
