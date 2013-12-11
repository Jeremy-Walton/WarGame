require 'socket'
require_relative 'war_player.rb'

class WarGameClient
	attr_reader :line

	def initialize(port)
		@hostname = 'localhost'
		@port = port
		#@player = WarPlayer.new([], name)
		#run
		#@s.close
	end

	def connect
		@s = TCPSocket.open(@hostname,@port)
		puts 'You connected'
	end

	def run	
		while true
			@line = @s.gets.chomp
			puts @line
		end
	end

end

war_client = WarGameClient.new(1234)
war_client.connect
war_client.run