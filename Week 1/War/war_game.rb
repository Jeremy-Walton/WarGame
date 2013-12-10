class WarGame
	attr_reader :deck, :player1, :player2, :winner

	def initialize(player1=WarPlayer.new, player2=WarPlayer.new)	
		@player1, @player2 = player1, player2
		@deck = CardDeck.new
		@cardsontable = []
	end

	def deal
		while(@deck.number_of_cards > 0) do
			@player1.take_cards(@deck.deal)
			@player2.take_cards(@deck.deal)
		end
	end

	def play_round(cardsontable=[])
		if (@player1.number_of_cards == 0)
			@winner = "player 1"
		else
			if (@player2.number_of_cards == 0)
			@winner = "player 2"
			else
				card1 = @player1.play_top_card
				card2 = @player2.play_top_card
				cardsontable.push(card1)
				cardsontable.push(card2)
				
					if (card1.value > card2.value)
						@player1.take_cards(cardsontable)
						
					else
						if (card1.value < card2.value)
							@player2.take_cards(cardsontable)
						else
							self.play_round(cardsontable)
						end
					end
				
				
			end
		end
	end

	def play_game
		deck.shuffle
		deal
		while true do
			if (@winner == "player 1")
				puts "player 1 wins"
				break
			end
			if (@winner == "player 2")
				puts "player 2 wins"
				break
			end
			play_round
		end
	end
end