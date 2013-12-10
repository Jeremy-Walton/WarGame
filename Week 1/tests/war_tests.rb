require 'minitest/autorun'

Dir[File.dirname(__FILE__) + '/../War/*.rb'].each {|file| require_relative "../War/#{File.basename(file)}"}

	
class TestWar < MiniTest::Unit::TestCase

	def test_game_initialization
		war = WarGame.new
		refute_nil(war.player1)
		refute_nil(war.player2)
	end

	def test_game_deal
		war = WarGame.new
		war.deal
		assert_equal(26, war.player1.number_of_cards)
		assert_equal(26, war.player2.number_of_cards)
	end

	def test_player1_wins
		player1 = WarPlayer.new([PlayingCard.new('3')])
		player2 = WarPlayer.new([PlayingCard.new('2')])
		war = WarGame.new(player1, player2)
		war.play_round()
		assert_equal(2, player1.number_of_cards)
		assert_equal(0, player2.number_of_cards)
	end

	def test_player2_wins
		player1 = WarPlayer.new([PlayingCard.new('2')])
		player2 = WarPlayer.new([PlayingCard.new('3')])
		war = WarGame.new(player1, player2)
		war.play_round()
		assert_equal(0, player1.number_of_cards)
		assert_equal(2, player2.number_of_cards)
	end

	def test_players_tie
		player1 = WarPlayer.new([PlayingCard.new('2')])
		player2 = WarPlayer.new([PlayingCard.new('2')])
		war = WarGame.new(player1, player2)
		war.play_round()
		assert_equal(0, player1.number_of_cards)
		assert_equal(0, player2.number_of_cards)
	end

	def test_deck_has_all_cards
		deck = CardDeck.new
		assert_equal(52, deck.number_of_cards)
	end

	def test_cards_are_shuffled
		war = WarGame.new
		war.deck.shuffle
		war.deal
		player1cards = []
		player2cards = []
		while (war.player1.number_of_cards > 0) do
			player1cards.push(war.player1.play_top_card.value)
		end
		while (war.player2.number_of_cards > 0) do
			player2cards.push(war.player2.play_top_card.value)
		end

		assert_equal(false, player1cards == player2cards)
		
	end

	def test_game_works
		war = WarGame.new
		war.play_game
	end

end

