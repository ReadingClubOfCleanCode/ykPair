#!/usr/bin/env ruby
require 'test/unit'
require 'coins'

class TC_Coins < Test::Unit::TestCase
	def setup
		@obj = Coins.new
	end

	def test_coins
		assert_equal("hoge", @obj.hoge)
	end
end

