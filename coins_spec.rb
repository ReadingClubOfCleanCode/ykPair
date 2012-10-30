require "rubygems"
require "spec"

require "coins"

describe Coins do
	it 'クラスがnewできること' do
		Coins.new.should_not be_nil
	end

	it 'calc 入力チェック' do
		input_count = { '500' => nil,
					'100' => 10,
					'50' => 10,
					'10' => 10,
					'5' => 10,
					'1' => 10 }
		input_amount = 10
		proc {
			Coins.new.calc(input_count, input_amount)
		}.should raise_error
	end
	
	it 'calc 答えを出す' do
		input_count = { 500 => 1,
					100 => 4,
					50 => 1,
					10 => 4,
					5 => 1,
					1 => 6 }
		input_amount = 1000
		Coins.new.calc(input_count, input_amount).should == { 500 => 1,
			100 => 4,
			50 => 1,
			10 => 4,
			5 => 1,
			1 => 5,
			'sum' => 16 }
	end
	
	it 'calc 答えがない場合' do
		input_count = { 500 => 1,
					100 => 4,
					50 => 1,
					10 => 4,
					5 => 1,
					1 => 6 }
		input_amount = 10000
		proc {
			Coins.new.calc(input_count, input_amount)
		}.should raise_error
	end
	
end

