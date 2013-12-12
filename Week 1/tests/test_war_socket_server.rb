require 'minitest/autorun'
require 'socket'

#Dir[File.dirname(__FILE__) + '/../War/*.rb'].each {|file| require_relative "../War/#{File.basename(file)}"}

require_relative '../war/war_game_client.rb'
require_relative '../server files/war_game_server.rb'

class TestWarSocketServer < MiniTest::Unit::TestCase

	def setup
		@server = WarGameServer.new(2222)
	end

	def teardown
		@server.close_server
	end
	def test_listening

		war_client = WarGameClient.new(2222)
		pass('Connection accepted')
	rescue Errno::ECONNREFUSED
		flunk('Refused connection')
	end

	def test_server_accepts_connections
		
			war_client1 = WarGameClient.new(2222)
			war_client2 = WarGameClient.new(2222)
			@server.accept_connections
			assert_equal(true, war_client1.is_connected(@server.check_connection))	
			assert_equal(true, war_client2.is_connected(@server.check_connection))
	end

	def test_server_gets_names
		war_client1 = WarGameClient.new(2222)
		war_client2 = WarGameClient.new(2222)
		@server.accept_connections
		war_client1.give_name('jem')
		@server.get_name(0)
		war_client2.give_name('bob')
		@server.get_name(1)	

		assert_equal('jem', @server.player_name)
	end

	def test_server_creates_game
		war_client1 = WarGameClient.new(2222)
		war_client2 = WarGameClient.new(2222)
		@server.accept_connections
		war_client1.give_name('One')
		@server.get_name(0)
		war_client2.give_name('Two')
		@server.get_name(1)
		@server.create_game

		assert_equal(true, @server.game != nil)
		
	end

	def test_server_deals_cards
		war_client1 = WarGameClient.new(2222)
		war_client2 = WarGameClient.new(2222)
		@server.accept_connections
		war_client1.give_name('One')
		@server.get_name(0)
		war_client2.give_name('Two')
		@server.get_name(1)
		@server.create_game
		@server.deal_to_players
		assert_equal(26, @server.player)
		
	end

	def test_server_shuffles_cards
		war_client1 = WarGameClient.new(2222)
		war_client2 = WarGameClient.new(2222)
		@server.accept_connections
		war_client1.give_name('One')
		@server.get_name(0)
		war_client2.give_name('Two')
		@server.get_name(1)
		@server.create_game
		deck1 = @server.deck
		@server.shuffle_deck
		deck2 = @server.deck
		assert_equal(false, deck1 == deck2)
		
	end

	def test_server_plays_one_round
		war_client1 = WarGameClient.new(2222)
		war_client2 = WarGameClient.new(2222)
		@server.accept_connections
		war_client1.give_name('One')
		@server.get_name(0)
		war_client2.give_name('Two')
		@server.get_name(1)
		@server.create_game
		@server.deal_to_players
		@server.play_one_round
		#Since the deck wasn't shuffled, player 1 always wins
		assert_equal(27, @server.player)
		
	end

	def test_server_runs_game_automatically
		war_client1 = WarGameClient.new(2222)
		war_client2 = WarGameClient.new(2222)
		@server.accept_connections
		war_client1.give_name('Fred')
		@server.get_name(0)
		war_client2.give_name('Jeremy')
		@server.get_name(1)
		@server.create_game
		@server.run_game
		
	end

	def test_server_runs_game_with_prompts
		war_client1 = WarGameClient.new(2222)
		war_client2 = WarGameClient.new(2222)
		@server.accept_connections
		war_client1.give_name('Fred')
		@server.get_name(0)
		war_client2.give_name('Jeremy')
		@server.get_name(1)
		@server.create_game
		@server.run_game
		
	end

end