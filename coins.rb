#!/usr/bin/env ruby

class Coins
	KINDS = [500, 100, 50, 10, 5, 1]
	# def hoge
	# end
	def loadInput
		result = {}
		[1, 5, 10, 50, 100, 500, 'amount'].each {|key|
			result[key] = $stdin.gets.to_i
		}
		result
	end

	def checkInput(input)
		(KINDS + ['amount']).each { |kind|
			raise "not positive number" if input[kind] < 0
			raise "must be less than 10^9" if input[kind] > 10**9
		}
	end

	def calc(input)
		amount = input['amount']

		answer = { 'sum' => 0 }
		KINDS.each { |kind|
			draw = [amount / kind, input[kind]].min

			answer[kind] = draw
			answer['sum'] += draw
			amount -= draw * kind
		}
		raise "cannot pay" if amount != 0
		answer
	end

	def print(result)
		$stdout.print("Answer: ")
		$stdout.puts [1, 5, 10, 50, 100, 500].map {|kind|
			"C#{kind}=#{result[kind]}"
		}.join(", ")
	end

	def main
		input = loadInput
		checkInput(input)
		result = calc(input)
		print(result)
	end
end

