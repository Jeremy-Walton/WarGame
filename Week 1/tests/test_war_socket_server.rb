require 'minitest/autorun'
require 'socket'

#Dir[File.dirname(__FILE__) + '/../War/*.rb'].each {|file| require_relative "../War/#{File.basename(file)}"}

require_relative '../war/war_game_client.rb'
require_relative '../server files/war_game_server.rb'

class TestWarSocketServer < MiniTest::Unit::TestCase
	def test_listening
		Thread.new do
			server = WarGameServer.new(2222)
		end
		Thread.new do
			war_client = WarGameClient.new(2222)
			war_client.connect
			war_client.run
		end
		pass('Connection accepted')
	rescue Errno::ECONNREFUSED
		flunk('Refused connection')
	end

	def test_server_accepts_connections
		Thread.new do
			server = WarGameServer.new(4444)
		end
		Thread.new do
			war_client1 = WarGameClient.new(4444)
			war_client2 = WarGameClient.new(4444)
			war_client1.connect
			war_client2.connect
			war_client1.run
			war_client2.run
		end
	end

	def est_server_game_starts
		server = WarGameServer.new(1234)
		war_client1 = WarGameClient.new
		war_client2 = WarGameClient.new
		server.accept_connections
		war_client1.connect(1234)
		war_client2.connect(1234)
		server.start_game
	end

end