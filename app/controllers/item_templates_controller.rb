class ItemTemplatesController < ApplicationController
  before_action :authenticate_player!

  before_action :set_item_template, only: [
    :show
  ]

  def index
    render json: ItemTemplate.all, status: :ok
  end

  def create
    item_template = ItemTemplate.new(item_template_params)

    if item_template.save!
      render json: item_template
    else
      render json: { errors: item_template.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def set_item_template
    @item_template = ItemTemplate.find(params[:item_template][:id])
  end

  def item_template_params
    params.require(:item_template).permit(
      :short_desc,
      :long_desc,
      :full_desc,
      kwords: []
    )
  end

end
