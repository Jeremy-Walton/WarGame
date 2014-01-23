class WarGame
	attr_reader :deck, :player1, :player2, :player3, :winner, :players
	attr_accessor :end_round
	def initialize(player1, player2, player3=nil)	
		@player1, @player2, @player3 = player1, player2, player3
		@deck = CardDeck.new
		@cardsontable = []
		@message1 = ''
		@message2 = ''
		@message3 = ''
	end
	def message1
		@message1
	end
	def message2
		@message2
	end
	def message3
		@message3
	end
	def deal(players)
		while(@deck.number_of_cards > 0) do
			players.each do |player|
				player.take_cards(@deck.deal)
			end
		end
	end
	def play_round(cards_on_table=[], players)
		player1 = players.at(0)
		player2 = players.at(1)

		unless (player1.number_of_cards == 0 || player2.number_of_cards == 0)
			card1 = player1.play_top_card
			card2 = player2.play_top_card
			@message1 = 'Player 1 has a ' + card1.to_s + '. Player 2 has a ' + card2.to_s
			cards_on_table.push(card1, card2)
			cards_on_table.shuffle!
			if(card1.value > card2.value)
				@message2 = 'Player 1 won the round.'
				player1.take_cards(cards_on_table) 
			end
			if(card2.value > card1.value)
				@message2 = 'Player 2 won the round.'
				player2.take_cards(cards_on_table)
			end
			if(card1.value == card2.value)
				puts "There was a war"
				play_round(cards_on_table, players)
			end
			@message3 = 'Player 1 has ' + player1.number_of_cards.to_s + " cards. Player 2 has " + player2.number_of_cards.to_s + ' cards.'
		else
			@winner = player1.name if(player2.number_of_cards == 0)
			@winner = player2.name if(player1.number_of_cards == 0)
		end
		end_round.call(card1, card2, winner) if end_round
	end
#	def play_three_way_round(cards_on_table=[], players)
#		puts "start of round"
#		player1 = players.at(0)
#		player2 = players.at(1)
#		player3 = players.at(2)
#		puts player1.number_of_cards.to_s + " " + player2.number_of_cards.to_s + " " + player3.number_of_cards.to_s
#			
#		unless (player1.number_of_cards == 0 || player2.number_of_cards == 0 || player3.number_of_cards == 0)
#			@card1, @card2, @card3 = player1.play_top_card, player2.play_top_card, player3.play_top_card
#			cards_on_table.push(card1, card2, card3)
#			cards_on_table.shuffle!
#			unless ((@card1.value > @card2.value && @card1.value > @card3.value) || (@card2.value > @card1.value && @card2.value > @card3.value) || (@card3.value > @card1.value && @card3.value > @card2.value))
#				puts 'war'
#				play_three_way_round(cards_on_table, players)
#				puts 'end of war'
#			else
#				player1.take_cards(cards_on_table) if(@card1.value > @card2.value && @card1.value > @card3.value)
#				player2.take_cards(cards_on_table) if(@card2.value > @card1.value && @card2.value > @card3.value)
#				player3.take_cards(cards_on_table) if(@card3.value > @card1.value && @card3.value > @card2.value)
#				cards_on_table = []
#				puts player1.number_of_cards.to_s + " " + player2.number_of_cards.to_s + " " + player3.number_of_cards.to_s
#			end
#		else
#			@players.delete_at(0) if (player1.number_of_cards == 0)
#			@players.delete_at(1) if (player2.number_of_cards == 0)
#			@players.delete_at(2) if (player3.number_of_cards == 0)
#			puts cards_on_table.to_s 
#			if (player1.number_of_cards + player2.number_of_cards + player3.number_of_cards != 52)
#				#Here is how to single out the running out of card problem. Who to give the cards is the next step.
#				puts 'whoops'
#				@players.at(0).take_cards(cards_on_table) 
#				cards_on_table = []
#				puts 'number 0f cards = ' + (player1.number_of_cards + player2.number_of_cards + player3.number_of_cards).to_s
#			end  
#			puts cards_on_table.to_s 
#		end
#		puts "end of round"
#	end
	def winner
		@winner
	end
	def play_game(players)
		@players = players
		deck.shuffle
		deal(@players)

		while (@winner == nil) do 
			if (@players.count == 2)
				play_round([], @players)
			end
			if (@players.count == 3)
				play_three_way_round([], @players)
			end
		end
		puts @winner
	end
end