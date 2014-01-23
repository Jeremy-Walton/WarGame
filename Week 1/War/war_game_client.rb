require 'socket'

class WarGameClient
	attr_reader :line
	def initialize(port)
		puts 'What server would you like to connect to?'
		#@hostname = 'localhost' 
		@hostname = STDIN.gets.chomp
		@port = port
		@s = TCPSocket.open(@hostname,@port)
		puts 'You connected'
		puts 'Waiting for other player.'
	end
	def give_name(name='')
		if(name == '')
			puts 'What is your name?'
			name = STDIN.gets.chomp
			puts 'Waiting for other player to enter name.'
			@s.puts name
		else
			@s.puts name
		end
	end
	def wait_for_message
		puts @s.gets.chomp
	end
	def send_message
		puts 'Please press [Enter] to play card'
		@s.puts(STDIN.gets.chomp)
		puts 'Waiting for other player to take turn'
	end
	def is_connected(message)
		return true if(message == 'Good')
	end
	def auto_run_client	
		wait_for_message
		give_name()
		wait_for_message
		wait_for_message
		while true
			wait_for_message
			send_message
		end
	end
end
#if(__FILE__ == $0)
war_client = WarGameClient.new(1234)
war_client.auto_run_client