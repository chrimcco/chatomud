class ApplicationController < ActionController::API

  def authenticate_player!
    username = request.headers['HTTP_X_PLAYER_USERNAME']
    token    = request.headers['HTTP_X_PLAYER_AUTHENTICATION_TOKEN']
    player   = Player.find_by(username: username)

    if player && Devise.secure_compare(player.authentication_token, token)
      @current_player = player
    else
      throw('wrong authentication token')
    end
  end

  def current_player
    @current_player
  end

end
