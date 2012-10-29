require "rubygems"
require "spec"

require "coins"

describe Coins do
	it 'クラスがnewできること' do
		Coins.new.should_not be_nil
	end
	it 'ほげほげ' do
		Coins.new.load.should be_nil
	end
end

