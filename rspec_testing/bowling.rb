class Bowling
	attr_reader :score
	def initialize
		@score = 0
	end
	def hit(pins) 
		@score = @score + pins
	end

	def score
		@score
	end
end