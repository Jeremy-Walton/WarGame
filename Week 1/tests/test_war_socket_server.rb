require 'minitest/autorun'
require 'socket'

Dir[File.dirname(__FILE__) + '/../War/*.rb'].each {|file| require_relative "../War/#{File.basename(file)}"}

class TestWarSocketServer < MiniTest::Unit::TestCase
	def test_listening
		TCPSocket.new("localhost", 3333)
		pass('Connection accepted')
	rescue Errno::ECONNREFUSED
		flunk('Refused connection')
	end
end