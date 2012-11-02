# -*- coding: utf-8 -*-
require "stringio"
require "./coins.rb"

# 標準入出力のフック用
def capture(stdin_content = '')
  old_stdin,old_stdout,old_stderr = $stdin,$stdout,$stderr
  begin
    $stdin = StringIO.new(stdin_content)
    $stdout = StringIO.new
    $stderr = StringIO.new
    yield
    {:stdout => $stdout.string, :stderr => $stderr.string}
  ensure
    $stdin,$stdout,$stderr = old_stdin,old_stdout,old_stderr
  end
end

describe Coins do
  describe "実行開始" do
    it "タイトルを表示する" do
      # capture {
      #   coins = Coins.new
      #   coins.should_not == nil
      # }.should == {:stdout => "硬貨の問題\n", :stderr => ""}
    end
  end

  # it 'loadInput' do
  #   capture("1\n2\n3\n4\n5\n6\n7\n") {
  #     Coins.new.loadInput.should == {1 => 1, 5 => 2, 10 => 3, 50 => 4, 100 => 5, 500 => 6, 'amount' => 7}
  #   }.should == {:stdout => "", :stderr => ""}
  # end
  # 
  # it 'calc 入力チェック' do
  #   input = { '500' => nil,
  #         '100' => 10,
  #         '50' => 10,
  #         '10' => 10,
  #         '5' => 10,
  #         '1' => 10,
  #         'amount' => 10 }
  #   proc {
  #     Coins.new.calc(input)
  #   }.should raise_error
  # end
  # 
  # it 'calc 答えを出す' do
  #   input = { 500 => 1,
  #         100 => 4,
  #         50 => 1,
  #         10 => 4,
  #         5 => 1,
  #         1 => 6,
  #         'amount' => 1000 }
  #   Coins.new.calc(input).should == { 500 => 1,
  #     100 => 4,
  #     50 => 1,
  #     10 => 4,
  #     5 => 1,
  #     1 => 5,
  #     'sum' => 16 }
  # end
  # 
  # it 'calc 答えがない場合' do
  #   input = { 500 => 1,
  #         100 => 4,
  #         50 => 1,
  #         10 => 4,
  #         5 => 1,
  #         1 => 6,
  #         'amount' => 10000 }
  #   proc {
  #     Coins.new.calc(input)
  #   }.should raise_error
  # end
# 
  # it 'checkInput' do
  #   1.should == 1
  # end
  # 
  # it 'all' do
  #   capture("6\n1\n4\n1\n4\n1\n1000\n") {
  #     Coins.new.main
  #   }.should == {:stdout => "Answer: C1=5, C5=1, C10=4, C50=1, C100=4, C500=1\n", :stderr => ""}
  # end
  # 
  # it 'print' do
  # end
end

# vim: ts=2 sw=2 expandtab
