require_relative './bowling'


describe Bowling, '#score' do
	it "returns 0 for all gutter game" do
		bowling = Bowling.new
		20.times { bowling.hit(0)}
		bowling.score.should eq(0)
	end	

	it "returns 20 for all gutter game" do
		bowling = Bowling.new
		20.times { bowling.hit(1)}
		bowling.score.should eq(20)
	end	

	it "returns 400 for all gutter game" do
		bowling = Bowling.new
		80.times { bowling.hit(5)}
		bowling.score.should eq(400)
	end	
end