class RoomsController < ApplicationController

  def index
    render json: Room.all, status: :ok
  end

end
