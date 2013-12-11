require 'socket'

class WarGameServer 

	server = TCPServer.open(2222)
	#game = WarGame.new()

	loop {                    
  		Thread.start(server.accept) do |client|
    		client.puts(Time.now.ctime) 
    		puts client.to_s + " connected"
    		client.puts('Hi ' + client.to_s)
			#client.puts "Closing the connection. Bye!"
    		#client.close                
  		end
	}

end