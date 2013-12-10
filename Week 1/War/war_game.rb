class WarGame
	attr_reader :deck, :player1, :player2, :player3, :winner, :players

	def initialize(player1=WarPlayer.new, player2=WarPlayer.new, player3=WarPlayer.new)	
		@player1, @player2, @player3 = player1, player2, player3
		@deck = CardDeck.new
		@cardsontable = []
	end

	def deal(players)
		while(@deck.number_of_cards > 0) do
			players.each do |players|
				players.take_cards(@deck.deal)
			end
		end
	end

	def play_round(cards_on_table=[], players)
		player1 = players.at(0)
		player2 = players.at(1)
		if (player1.number_of_cards > 0)
			if (player2.number_of_cards > 0)
				card1 = player1.play_top_card
				card2 = player2.play_top_card
				cards_on_table.push(card1, card2)

				player1.take_cards(cards_on_table) if(card1.value > card2.value)
				player2.take_cards(cards_on_table) if(card2.value > card1.value)
				play_round(cards_on_table, players) if(card1.value == card2.value)
			else
				@winner = 'player1'
			end
		else
			@winner = 'player2'
		end
	end

	def play_three_way_round(cards_on_table=[], players)
		player1 = players.index(0)
		player2 = players.index(1)
		player3 = players.index(2)
		if (player1.number_of_cards > 0)
			if (player2.number_of_cards > 0)
				if (player3.number_of_cards > 0)
					card1 = player1.play_top_card
					card2 = player2.play_top_card
					card3 = player3.play_top_card
					cards_on_table.push(card1, card2, card3)

					unless ((card1.value > card2.value && card1.value > card3.value) || (card2.value > card1.value && card2.value > card3.value) || (card3.value > card1.value && card3.value > card1.value))
						play_three_way_round(cards_on_table, player1, player2, player3)
					else
						player1.take_cards(cards_on_table) if(card1.value > card2.value && card1.value > card3.value)
						player2.take_cards(cards_on_table) if(card2.value > card1.value && card2.value > card3.value)
						player3.take_cards(cards_on_table) if(card3.value > card1.value && card3.value > card1.value)
					end
					
				else
					@players.delete_at(2)
				end
			else
				@players.delete_at(1)
			end
		else
			@players.delete_at(0)
		end
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
				play_three_way_round(players)
			end
		end
		puts @winner
		#while true do
		#	
		#		if (@winner == [player1])
		#			puts "player 1 wins"
		#			break
		#		end
		#		if (@winner == [player2])
		#			puts "player 2 wins"
		#			break
		#		end
		#		play_round()
		#end
	end



end