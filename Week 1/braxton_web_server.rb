require 'socket'
	
server = TCPServer.new(9090)
user_number = 0
while clients = server.accept
	Thread.new(clients) do |client|
		File.open("index.html") do |file|
			while chunk = file.gets
				client.write(chunk)
			end
		end
		client.close
	end
end