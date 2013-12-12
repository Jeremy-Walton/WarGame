require 'socket'
require_relative 'war_player.rb'

class WarGameClient
	attr_reader :line

	def initialize(port)
		puts 'What server would you like to connect to?'
		@hostname = gets.chomp
		@port = port
		@s = TCPSocket.open(@hostname,@port)
		puts 'You connected'
		puts 'Waiting for other player.'
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

	def wait_for_message
		puts @s.gets.chomp
	end

	def send_message
		puts 'Please press [Enter] to play card'
		@s.puts(STDIN.gets.chomp)
		puts 'Waiting for other player to take turn'
	end

end

war_client = WarGameClient.new(1234)
war_client.wait_for_message
war_client.give_name()
war_client.wait_for_message
war_client.wait_for_message
while true
	war_client.wait_for_message
	war_client.send_message
end

#war_client.connect
#war_client.is_connected
#war_client.run