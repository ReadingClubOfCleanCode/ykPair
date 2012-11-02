#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

class Coins
  KINDS = [500, 100, 50, 10, 5, 1]
  def initialize
    $stdout.puts("硬貨の問題")
  end
  # def hoge
  # end
  def loadInput
    result = {}
    KINDS.sort.each {|key|
      $stdout.print("#{key}円玉の枚数:")
      result[key] = $stdin.gets.to_i
    }
    $stdout.print("支払い金額:")
    result['amount'] = $stdin.gets.to_i
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

# vim: ts=2 sw=2 expandtab
