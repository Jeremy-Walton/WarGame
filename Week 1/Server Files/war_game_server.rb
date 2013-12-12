require 'socket'

require_relative '../war/war_player.rb'
require_relative '../war/war_game.rb'
require_relative '../war/card_deck.rb'
require_relative '../war/playing_card.rb'

class WarGameServer 

	def initialize(port)
		@server = TCPServer.open(port)
		@client_list = []
		@port = port
		@names = []
		puts 'Server created on port: ' + @port.to_s
		#accept_connections
		#get_names
		#start_game
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

	def check_connection
		return 'Good'
	end

	def close_server
		@server.close
	end

	def accept_connections	
		@client_list.push(@server.accept)
		puts('Player 1 Connected')
		@client_list.push(@server.accept)
		puts('Player 2 Connected')
		puts "Two people are connected"
	end

	def get_name(index)
		
		@names.push(@client_list[index].gets.chomp)
		puts 'Hi ' + @names[index] + ", welcome to the war game server."
		
	end

	def create_game
		puts 'Creating game'
		@player1 = WarPlayer.new([], @names[0])
		puts 'player 1 created'
		@player2 = WarPlayer.new([], @names[1])	
		puts 'player 2 created'
		@game = WarGame.new(@player1, @player2)
	end

	def run_game
		shuffle_deck
		deal_to_players
		while @game.winner == nil
			play_one_round
		end
		puts @game.winner + ' won!'
	end

	def deal_to_players
		puts 'Dealing'
		@game.deal([@player1, @player2])
	end

	def shuffle_deck
		puts 'Shuffling deck'
		@game.deck.shuffle
	end

	def deck
		@game.deck.deal
	end

	def game
		@game.class
	end

	def player
		@player1.number_of_cards
	end

	def player_name
		@names[0]
	end

	def play_one_round
		puts 'Playing one round'
		@game.play_round([], [@player1, @player2])
	end

end

#war_server = WarGameServer.new(1234)
