# RSPEC test of blackjack suite

# class Board

require 'board.rb'
include Blackjack

# note: no initialize method

describe Board do
  let (:brd) do
    board = Board.new
    board.board_copy("Dealer", ["John", "Peter"])
    board
  end
  it 'should give you a Board' do
    expect(brd).to be_a(Board)
  end

  describe '#players' do
    it 'should return the object in instance variable' do
      expect(brd.players).to eq(["John", "Peter"])
    end

  end
end






