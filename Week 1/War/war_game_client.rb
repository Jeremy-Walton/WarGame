require 'socket'
require_relative 'war_player.rb'

class WarGameClient
	attr_reader :line

	def initialize(port)
		@hostname = 'localhost'
		@port = port
		@s = TCPSocket.open(@hostname,@port)
		puts 'You connected'
		#@player = WarPlayer.new([], name)
		#run
		#@s.close
	end

	def give_name(name='')
		if(name == '')
			puts 'What is your name?'
			name = STDIN.gets.chomp
			@s.puts name
		else
			@s.puts name
		end
	end

	def is_connected(message)
		return true if(message == 'Good')
	end

end

#war_client = WarGameClient.new(1234)
#war_client.connect
#war_client.is_connected
#war_client.run