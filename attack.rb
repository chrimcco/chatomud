require 'socket'

host, port = 'localhost', 1234

TCPSocket.open(host, port) do |socket|
  socket.puts "Hey there"
  socket.write 'he'
  socket.flush
  socket.close
end