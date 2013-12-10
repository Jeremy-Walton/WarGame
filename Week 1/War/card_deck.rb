class CardDeck


	def initialize
		@cards = []
		ranks = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
		4.times do
			ranks.each do |ranks|
				@cards = @cards.push(PlayingCard.new(ranks))
			end
		end
	end

	def number_of_cards
		@cards.count
	end

	def shuffle
		@cards.shuffle!
	end

	def deal
		@cards.pop
	end

end