class CardDeck

	def initialize
		@deck = [PlayingCard.new('2'), PlayingCard.new('2'), PlayingCard.new('2'), PlayingCard.new('2'), PlayingCard.new('3'), PlayingCard.new('3'), PlayingCard.new('3'), PlayingCard.new('3'), PlayingCard.new('4'), PlayingCard.new('4'),
				 PlayingCard.new('4'), PlayingCard.new('4'), PlayingCard.new('5'), PlayingCard.new('5'), PlayingCard.new('5'), PlayingCard.new('5'), PlayingCard.new('6'), PlayingCard.new('6'), PlayingCard.new('6'), PlayingCard.new('6'), 
				 PlayingCard.new('7'), PlayingCard.new('7'), PlayingCard.new('7'), PlayingCard.new('7'), PlayingCard.new('8'), PlayingCard.new('8'), PlayingCard.new('8'), PlayingCard.new('8'), PlayingCard.new('9'), PlayingCard.new('9'),
				 PlayingCard.new('9'), PlayingCard.new('9'), PlayingCard.new('10'), PlayingCard.new('10'), PlayingCard.new('10'), PlayingCard.new('10'), PlayingCard.new('J'), PlayingCard.new('J'), PlayingCard.new('J'), PlayingCard.new('J'), 
				 PlayingCard.new('Q'), PlayingCard.new('Q'), PlayingCard.new('Q'), PlayingCard.new('Q'), PlayingCard.new('K'), PlayingCard.new('K'), PlayingCard.new('K'), PlayingCard.new('K'),
				 PlayingCard.new('A'), PlayingCard.new('A'), PlayingCard.new('A'), PlayingCard.new('A') ]
	end

	def deck
		@deck
	end

	def number_of_cards
		@deck.length
	end

	def shuffle(times)
		times.times do
			@deck = @deck.shuffle
		end
	end

end