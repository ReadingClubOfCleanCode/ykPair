#!/usr/bin/env ruby

class CoinProblemSolver
	KINDS = [500, 100, 50, 10, 5, 1]

	def loadCoinCountsAndPrice
		result = {}
		[1, 5, 10, 50, 100, 500, 'amount'].each {|key|
			input_text = $stdin.gets
			result[key] = input_text.to_i
		}
		result
	end

	def checkValidityOfCoinCountsAndPrice(input)
		(KINDS + ['amount']).each { |kind|
			raise "not positive number" if input[kind] < 0
			raise "must be less than 10^9" if input[kind] > 10**9
		}
	end

	def solveProblem(input)
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

	def printAnswers(result)
		$stdout.print("Answer: ")
		coin_texts = [1, 5, 10, 50, 100, 500].map {|kind|
			"C#{kind}=#{result[kind]}"
		}
		text_to_print = coin_texts.join(", ")
		$stdout.puts text_to_print
	end

	def run
		input = loadCoinCountsAndPrice
		checkValidityOfCoinCountsAndPrice(input)
		result = solveProblem(input)
		printAnswers(result)
	end
end

# coins = CoinProblemSolver.new
# coins.run

