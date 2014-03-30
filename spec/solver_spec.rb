require 'spec_helper'

describe Solver do
  include ExamplePuzzles

  before :each do
    @puzzle = "105802000090076405200400819019007306762083090000061050007600030430020501600308900"
    @solver = Solver.new(@puzzle)
  end

  context "helper methods" do
    it "has a board with 81 cells" do
      expect(@solver.board.length).to eq(81)
    end

    it "gets all values from 27 member cells" do
      expect(@solver.member_values(0).length).to eq(27)
    end

    it "gets possible moves for a given cell" do
      expect(@solver.possible_moves(1)).to eq(["4", "7"]) 
    end

    it "returns true if cell is open" do
      expect(@solver.open_cell?("0")).to be(true)
    end
  end

  context "solving logic" do
    it "adds move to the board" do
      @solver.make_move(["3"], 1)
      expect(@solver.board.join('')).to eq("135802000090076405200400819019007306762083090000061050007600030430020501600308900")
    end

    it "only makes move if moves length is less than or equal to precision" do
      @solver.try_move(1)
      expect(@solver.board).to eq(@puzzle.split(''))
    end

    it "resets precision value to 1" do
      @solver.precision = 2
      @solver.try_move(1)
      expect(@solver.precision).to eq(1)
    end

    it "resets board to original puzzle if moves empty" do
      @solver.board = "10580255090076405200400819319007306762083090000061050007600030430020501600308900".split('')
      @solver.make_move([], 1)
      expect(@solver.board).to eq(@puzzle.split(''))
    end

    it "returns false if board contains open cells" do
      expect(@solver.solved?).to be(false)
    end

    it "does not add  move to the board when multiple possibilities" do
      @solver.try_move(1)
      expect(@solver.board.join('')).to eq(@puzzle)
    end

    it "adds  move to the board when one possibility" do
      solver = Solver.new("609238745274561398853947621486352179792614583531879264945723816328196457167485932")
      solver.try_move(1)
      expect(solver.board.join('')).to eq("619238745274561398853947621486352179792614583531879264945723816328196457167485932")
    end

    it "increases precision value when board doesn't change" do
      @solver.begin_board = "105802000090076405200400819019007306762083090000061050007600030430020501600308900".split('')
      @solver.guess_if_neccessary
      expect(@solver.precision).to eq(2)
    end
  end

  context "#solve! example puzzles of varying difficulty" do
    it "solves a puzzle with one open cell" do
      puzzle = "609238745274561398853947621486352179792614583531879264945723816328196457167485932"
      solver = Solver.new(puzzle)
      expect(solver.solve!).to eq("619238745274561398853947621486352179792614583531879264945723816328196457167485932")
    end

    it "solves seven easy puzzles" do
      puzzles = ExamplePuzzles::EASY
      puzzles.each do |puzzle|
        solver = Solver.new(puzzle[0])

        expect(solver.solve!).to eq(puzzle[1])
      end
    end

    it "solves seven difficult puzzles" do
      puzzles = ExamplePuzzles::DIFFICULT
      puzzles.each do |puzzle|
        solver = Solver.new(puzzle[0])
        expect(solver.solve!).to eq(puzzle[1])
      end
    end

    it "solves two very difficult puzzles" do
      puzzles = ExamplePuzzles::VERY_DIFFICULT
      puzzles.each do |puzzle|
        solver = Solver.new(puzzle[0])
        expect(solver.solve!).to eq(puzzle[1])
      end

    end

  end

end

