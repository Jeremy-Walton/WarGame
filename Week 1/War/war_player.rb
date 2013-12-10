class WarPlayer

	def initialize(cards)
		if(cards == [])
			@cards = []
		else
			@cards = [cards]
		end
	end

	def cards
		@cards
	end
	
	def name
		@name
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
end