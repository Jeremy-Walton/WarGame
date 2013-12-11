require 'minitest/autorun'

Dir[File.dirname(__FILE__) + '/../War/*.rb'].each {|file| require_relative "../War/#{File.basename(file)}"}

	
class TestWar < MiniTest::Unit::TestCase

	def _game_initialization
		player1 = WarPlayer.new([], 'b')
		player2 = WarPlayer.new([], 'h')
		war = WarGame.new(player1, player2)
		refute_nil(war.player1)
		refute_nil(war.player2)
	end

	def _game_deal
		player1 = WarPlayer.new([], 'b')
		player2 = WarPlayer.new([], 'h')
		war = WarGame.new(player1, player2)
		war.deal([player1, player2])
		assert_equal(26, war.player1.number_of_cards)
		assert_equal(26, war.player2.number_of_cards)
	end

	def _player1_wins
		player1 = WarPlayer.new([PlayingCard.new('3')], 'a')
		player2 = WarPlayer.new([PlayingCard.new('2')], 'a')
		war = WarGame.new(player1, player2)
		war.play_round([], [player1, player2])
		assert_equal(2, war.player1.number_of_cards)
		assert_equal(0, war.player2.number_of_cards)
	end

	def _player2_wins
		player1 = WarPlayer.new([PlayingCard.new('2')], 'a')
		player2 = WarPlayer.new([PlayingCard.new('3')], 'a')
		war = WarGame.new(player1, player2)
		war.play_round([], [player1, player2])
		assert_equal(0, war.player1.number_of_cards)
		assert_equal(2, war.player2.number_of_cards)
	end

	def _players_tie
		player1 = WarPlayer.new([PlayingCard.new('2')], 'w')
		player2 = WarPlayer.new([PlayingCard.new('2')], 'q')
		war = WarGame.new(player1, player2)
		war.play_round([], [player1, player2])
		assert_equal(0, war.player1.number_of_cards)
		assert_equal(0, war.player2.number_of_cards)
	end

	def _deck_has_all_cards
		deck = CardDeck.new
		assert_equal(52, deck.number_of_cards)
	end

	def _cards_are_shuffled
		player1 = WarPlayer.new([], 'q')
		player2 = WarPlayer.new([], 'e')
		war = WarGame.new(player1, player2)
		war.deck.shuffle
		war.deal([player1, player2])
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
		player1 = WarPlayer.new([], 'One')
		player2 = WarPlayer.new([], 'Two')
		war = WarGame.new(player1, player2)
		war.play_game([player1, player2])
	end

	def _three_player_game_works
		player1 = WarPlayer.new([], "One")
		player2 = WarPlayer.new([], "Two")
		player3 = WarPlayer.new([], "Three")
		war = WarGame.new(player1, player2, player3)
		war.play_game([player1, player2, player3])
	end

end

