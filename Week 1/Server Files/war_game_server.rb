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

	def accept_connections	
		2.times do |time|
			@client_list.push(@server.accept)
			puts'Player ' + (time+1).to_s + ' Connected'
		end
		broadcast("Two people are connected")
	end

	def get_name(index)
		@names.push(@client_list[index].gets.chomp)
		@client_list[index].puts 'Hi ' + @names[index] + ", welcome to the war game server."
		puts @names[index]
	end

	def create_game
		@player1 = WarPlayer.new([], @names[0])
		@player2 = WarPlayer.new([], @names[1])	
		@game = WarGame.new(@player1, @player2)
		puts 'Game created'
	end

	def run_game
		shuffle_deck
		deal_to_players
		while @game.winner == nil
			wait_for_message
			play_one_round
			puts 'Round over, Results: ' + @game.message1 + ' : ' + @game.message2 + ' : ' + @game.message3
			broadcast('Round over, Results: ' + @game.message1 + ' : ' + @game.message2 + ' : ' + @game.message3)
		end
		broadcast(@game.winner + ' won!')
	end

	def broadcast(message)
		@client_list.each do |client|
			client.puts message
		end
	end

	def run_game_auto
		shuffle_deck
		deal_to_players
		while @game.winner == nil
			play_one_round
			puts('Round over, Results: ' + @game.message1 + ' : ' + @game.message2 + ' : ' + @game.message3)
		end
		puts(@game.winner + ' won!')
	end

	def wait_for_message
		@client_list.each do |client|
			message = client.gets.chomp
			unless (message == '')		
				client.puts 'Please just press enter'
			end
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

	def play_one_round
		puts 'Playing one round'
		@game.play_round([], [@player1, @player2])
	end

	def auto_run_server
		accept_connections
		get_name(0)
		get_name(1)
		create_game
		run_game
	end

	def check_connection
		return 'Good'
	end

	def close_server
		@server.close
	end

	def deck
		@game.deck.deal
	end

	def game
		@game.class
	end

	def player_cards?
		@player1.number_of_cards
	end

	def player_name
		@names[0]
	end
end

war_server = WarGameServer.new(1234)
war_server.auto_run_server