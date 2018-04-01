class RoomsController < ApplicationController
  before_action :authenticate_player!

  before_action :set_room, only: [
    :show
  ]

  def index
    render json: Room.all, status: :ok
  end

  def create
    room = Room.new(room_params)

    if room.save!
      room.reassign_exits
      ChatoMud::Controllers::Rooms::RoomController.new(Server, room)
      render json: room
    else
      render json: { errors: room.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def set_room
    @room = Room.find(params[:room][:id])
  end

  def room_params
    params.require(:room).permit(
      :title,
      :description,
      :nr_id,
      :ner_id,
      :er_id,
      :ser_id,
      :sr_id,
      :swr_id,
      :wr_id,
      :nwr_id,
      :ur_id,
      :dr_id
    )
  end

end
