class WarPlayer

	def initialize(cards=[])
		@cards = cards
	end

	def play_top_card
		@cards.pop
	end

	def number_of_cards
		@cards.count
	end
	

	def take_cards(cards)
		@cards.push(*cards)
	end

	def take_card_from_deck(card)
		@cards.unshift(card)
	end
end