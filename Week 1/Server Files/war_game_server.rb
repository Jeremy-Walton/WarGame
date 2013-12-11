require 'socket'

class WarGameServer 

	def initialize(port)
		@server = TCPServer.open(port)
		@client_list = []
		puts 'Server created on port: ' + port.to_s
		accept_connections
		start_game
		#loop {   
		#	            
  		#		Thread.start(@server.accept) do |client|
  		#				@client_list.push(client) 
    	#				client.puts("Connection made #{@client_list.count}")
    	#				if (@client_list.count == 1)
  		#					client.puts('Waiting for another player...')
  		#				end
    	#				if (@client_list.count == 2)
  		#					start_game
  		#				end
  		#		end
		#}
	end

	def accept_connections	
			@client_list.push(@server.accept)
			puts('Player 1 Connected')
			@client_list.push(@server.accept)
			puts('Player 2 Connected')
			puts "Two people are connected"
	end

	def start_game
			puts 'Starting game'
			@client_list.at(0).puts('What is your name?')
			name = @client_list.at(0).gets.chomp
			puts name
			@client_list.at(1).puts('What is your name?')
			name = @client_list.at(1).gets.chomp
		#@client_list.at(0).puts 'Game starting'
		#@client_list.at(1).puts 'Game starting'
		#game = WarGame.new(@client_list.at(0).player, @client_list.at(1).player)
		#game.deal(@client_list)
		#game.play_round

	end

end

war_server = WarGameServer.new(1234)
