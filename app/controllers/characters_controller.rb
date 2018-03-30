class CharactersController < ApplicationController
  before_action :authenticate_player!

  before_action :set_character, only: [
    :show
  ]

  def show
    render json: @character
  end

  def create
    character = Character.new(character_params)

    if character.save!
      render json: character
    else
      render json: { errors: character.errors.messages }, status: :unprocessable_entity
    end
  end

  def yours
    render json: current_player.characters[0]
  end

  private

  def set_character
    @character = Character.find(params[:character][:id])
  end

  def character_params
    params.require(:character).permit(
      :short_desc
    )
  end

end
