require 'spec_helper'

describe BoardUtils do

  before :each do
    board = "105802000090076405200400819019007306762083090000061050007600030430020501600308900"
    @util = BoardUtils.new(board.split(''))
  end

  it "returns all row 0 values" do
    expect(@util.row_values(0)).to eq("105802000".split(""))
  end

  it "returns all row 8 values" do
    expect(@util.row_values(9)).to eq("090076405".split(""))
  end

  it "returns all col 0 values" do
    expect(@util.col_values(0)).to eq(["1", "0", "2", "0", "7", "0", "0", "4", "6"])
  end

  it "returns all col 6 values" do
    expect(@util.col_values(6)).to eq(["0", "4", "8", "3", "0", "0", "0", "5", "9"])
  end

  it "retuns all box 0 values" do
    expect(@util.box_values(0)).to eq(["1", "0", "5", "0", "9", "0", "2", "0", "0"])
  end

  it "retuns all box 5 values" do
    expect(@util.box_values(31)).to eq(["0", "0", "7", "0", "8", "3", "0", "6", "1"])
  end
end
