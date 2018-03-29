if Rails.const_defined?(:Server) && !Rails.env.test?
  require 'server'

  Thread.abort_on_exception = true
  Thread.new do
    ::Server = ChatoMud::Server.new
    ::Server.listen
  end
end
