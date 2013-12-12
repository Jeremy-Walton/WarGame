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
		broadcast("Two people are connected")
	end

	def broadcast(message)
		@client_list.each do |client|
			client.puts message
		end
	end

	def get_name(index)
		
		@names.push(@client_list[index].gets.chomp)
		@client_list[index].puts 'Hi ' + @names[index] + ", welcome to the war game server."
		puts @names[index]
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
			wait_for_message
			play_one_round
			broadcast('Round over, here are the results: ' + @game.message1 + ' \n ' + @game.message2 + ' \n ' + @game.message3)
		end
		broadcast(@game.winner + ' won!')
	end

	def wait_for_message
		message = @client_list[0].gets.chomp
		if(message == '')

		else		
			@client_list[0].puts 'Please just press enter'
		end
		message = @client_list[1].gets.chomp
		if(message == '')

		else		
			@client_list[1].puts 'Please just press enter'
		end
	end

	def deal_to_players
		broadcast('Dealing')
		@game.deal([@player1, @player2])
	end

	def shuffle_deck
		broadcast('Shuffling deck')
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

war_server = WarGameServer.new(1234)
war_server.accept_connections
war_server.get_name(0)
war_server.get_name(1)
war_server.create_game
war_server.run_game
