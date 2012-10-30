#!/usr/bin/env ruby

class Coins
	KINDS = [500, 100, 50, 10, 5, 1]
	# def hoge
	# end
	def load; end
	def calc(counts, amount)
		KINDS.each { |kind|
			raise "not positive number" if counts[kind] < 0
		}

		answer = { 'sum' => 0 }
		KINDS.each { |kind|
			draw = [amount / kind, counts[kind]].min

			answer[kind] = draw
			answer['sum'] += draw
			amount -= draw * kind
		}
		raise "cannot pay" if amount != 0
		answer
	end
	def print; end
end

