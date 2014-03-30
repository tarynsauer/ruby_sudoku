require 'spec_helper'

describe Solver do
  include ExamplePuzzles

  before :each do
    @puzzle = "105802000090076405200400819019007306762083090000061050007600030430020501600308900"
    @sudoku = Solver.new(@puzzle)
  end

  it "creates a new board array" do
    @sudoku.board.length == 81
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
      expect(@sudoku.solved?).to eq(false) 
    end

    it "places move on board" do
      moves = @sudoku.possible_moves(12) 
      @sudoku.place_value_on_board(moves, 12)
      expect(@sudoku.board[12]).to_not eq("0")
    end
    
    context "example puzzles" do
      it "solves puzzle with one open space" do
        puzzle = "609238745274561398853947621486352179792614583531879264945723816328196457167485932"
        solver = Solver.new(puzzle)
        expect(solver.solve!).to eq("619238745274561398853947621486352179792614583531879264945723816328196457167485932") 
      end
   
      it "solves puzzle with two open spaces" do
        puzzle = "609238745274561398853947021486352179792614583531879264945723816328196457167485932"
        solver = Solver.new(puzzle)
        expect(solver.solve!).to eq("619238745274561398853947621486352179792614583531879264945723816328196457167485932") 
      end

      it "solves easy puzzles--no guessing needed" do
        ExamplePuzzles::EASY.each do |puzzle|
          solver = Solver.new(puzzle[0])
          expect(solver.solve!).to eq(puzzle[1])
        end
      end

      it "solves hard puzzles--requires guessing" do
        ExamplePuzzles::DIFFICULT.each do |puzzle|
          solver = Solver.new(puzzle[0])
          expect(solver.solve!).to eq(puzzle[1])
        end
      end

      it "solves very hard puzzles--requires lots of guessing" do
        ExamplePuzzles::VERY_DIFFICULT.each do |puzzle|
          solver = Solver.new(puzzle[0])
          expect(solver.solve!).to eq(puzzle[1])
        end
      end
    end
  end

end

