require 'socket'

class WarGameClient

	hostname = 'localhost'
	port = 2222

	s = TCPSocket.open(hostname,port)

while line = s.gets
	puts line.chop
end

s.close

end