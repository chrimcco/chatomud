class SystemController < ApplicationController

  def info
    render json: {
      ruby_version: RUBY_VERSION,
      rails_version: Rails.version,
      git_revision: `git rev-parse HEAD`.strip,
      version: `git describe --tags --long`.strip,

      time_string: Server.timers_assistant.calendar.time_string
    }
  end

end

