require 'minitest/autorun'

Dir[File.dirname(__FILE__) + '/../War/*.rb'].each {|file| require_relative "../War/#{File.basename(file)}"}

	
class TestWar < MiniTest::Unit::TestCase
	def setup
		@war = WarGame.new
		@deck = CardDeck.new
	end
	def test_player1_wins
		player1 = WarPlayer.new(PlayingCard.new('3'))
		player2 = WarPlayer.new(PlayingCard.new('2'))
		@war.play_round(player1, player2)
		assert_equal(2, player1.number_of_cards)
		assert_equal(0, player2.number_of_cards)
	end

	def test_player2_wins
		player1 = WarPlayer.new(PlayingCard.new('2'))
		player2 = WarPlayer.new(PlayingCard.new('3'))
		@war.play_round(player1, player2)
		assert_equal(0, player1.number_of_cards)
		assert_equal(2, player2.number_of_cards)
	end

	def test_players_tie
		player1 = WarPlayer.new(PlayingCard.new('2'))
		player2 = WarPlayer.new(PlayingCard.new('2'))
		@war.play_round(player1, player2)
		assert_equal(0, player1.number_of_cards)
		assert_equal(0, player2.number_of_cards)
	end

	def test_deck_has_all_cards
		assert_equal(52, @deck.number_of_cards)
	end

	def test_cards_dealt_to_players
		player1 = WarPlayer.new([])
		player2 = WarPlayer.new([])
		26.times do 
					@war.deal(player1, @deck.deck)
					@war.deal(player2, @deck.deck)
		end
		assert_equal(26, player1.number_of_cards)
		assert_equal(26, player2.number_of_cards)
	end

	def test_cards_are_shuffled
		player1 = WarPlayer.new([])
		player2 = WarPlayer.new([])
		deck2 = CardDeck.new
		deck3 = deck2.shuffle(1)

		assert_equal(false, deck2 == deck3)


	end

end

