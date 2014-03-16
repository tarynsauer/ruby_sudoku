require 'spec_helper'

describe Sudoku do
  before :each do
    @puzzle = "105802000090076405200400819019007306762083090000061050007600030430020501600308900"
    @sudoku = Sudoku.new(@puzzle)
  end

  it "creates a new board array" do
    @sudoku.board.length == 81
  end

  context "number groups" do
    it "returns all row 0 values" do
      expect(@sudoku.row_values(0)).to eq("105802000".split(""))
    end

    it "returns all row 8 values" do
      expect(@sudoku.row_values(9)).to eq("090076405".split(""))
    end

    it "returns all col 0 values" do
      expect(@sudoku.col_values(0)).to eq(["1", "0", "2", "0", "7", "0", "0", "4", "6"])
    end

    it "returns all col 6 values" do
      expect(@sudoku.col_values(6)).to eq(["0", "4", "8", "3", "0", "0", "0", "5", "9"])
    end

    it "retuns all box 0 values" do
      expect(@sudoku.box_values(0)).to eq(["1", "0", "5", "0", "9", "0", "2", "0", "0"])
    end

    it "retuns all box 5 values" do
      expect(@sudoku.box_values(31)).to eq(["0", "0", "7", "0", "8", "3", "0", "6", "1"])
    end
  end

  context "possible moves" do

    it "returns all taken values" do
      expect(@sudoku.all_taken_values(1).sort).to eq(["1", "2", "3", "5", "6", "8", "9"])
    end

    it "returns all possible moves" do
      expect(@sudoku.possible_moves(1)).to eq(["4", "7"])
    end
  end

  context "solving the puzzle" do
    it "returns false when board contains unfilled spaces" do
      expect(@sudoku.unsolved?).to eq(true) 
    end

    it "returns false when a move cannot be made" do
      expect(@sudoku.make_move?(1)).to eq(false)
    end

    it "returns true when a move cannot be made" do
      expect(@sudoku.make_move?(12)).to eq(true)
    end

    it "places move on board" do
      @sudoku.place_value_on_board(12)
      expect(@sudoku.board[12]).to_not eq("0")
    end

  end
end
