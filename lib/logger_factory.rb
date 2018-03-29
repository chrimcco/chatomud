require 'rails'
require 'yell'

module ChatoMud

  module LoggerFactory

    def self.create_mud_server_logger
      root = Rails.root.to_s

      Yell.new do |logger|
        logger.name = 'server'
        logger.adapter(:file, root + "/log/#{Rails.env.to_s}/server.log")
        case Rails.env.to_s
          when 'development', 'test'
            logger.adapter STDOUT, format: Yell::BasicFormat
          end
      end
    end

    def self.create_player_logger(username)
      root = Rails.root.to_s

      Yell.new do |logger|
        logger.name = username
        logger.adapter :file, root + "/log/#{Rails.env.to_s}/players/#{username}.log"
        case Rails.env.to_s
          when 'development', 'test'
            logger.adapter STDOUT, format: Yell::BasicFormat
          end
      end
    end

  end

end