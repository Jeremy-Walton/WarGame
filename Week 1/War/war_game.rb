class WarGame

	def play_round(player1, player2)
		card1 = player1.play_top_card
		card2 = player2.play_top_card
		cards = [card1, card2]

		unless card1.value == card2.value
			if (card1.value > card2.value)
				player1.take_cards(cards)
			else
				player2.take_cards(cards)
			end
		end

	end

	def deal(player, deck)
		if deck.length> 0
			player.take_cards(PlayingCard.new(deck.pop))
		end
	end
end