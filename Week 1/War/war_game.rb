class WarGame
	attr_reader :deck, :player1, :player2

	def initialize(player1=WarPlayer.new, player2=WarPlayer.new)	
		@player1, @player2 = player1, player2
		@deck = CardDeck.new
	end

	def deal
		while(@deck.number_of_cards > 0) do
			@player1.take_cards(@deck.deal)
			@player2.take_cards(@deck.deal)
		end
	end

	def play_round
		if (@player1.number_of_cards == 0)
			puts "player 1 wins"
		end
		if (@player2.number_of_cards == 0)
			pluts "player 2 wins"
		end
		card1 = @player1.play_top_card
		card2 = @player2.play_top_card
		cards = [card1, card2]

		unless card1.value == card2.value
			if (card1.value > card2.value)
				player1.take_cards(cards)
			else
				player2.take_cards(cards)
			end
		end

	end

	def play_game
		deck.shuffle
		deal
		while true do
			play_round
		end
	end
end