require 'spec_helper'

describe Solver do
  include ExamplePuzzles
  let(:very_easy_puzzle) { ExamplePuzzles::VERY_EASY.first }
  let(:easy_puzzle) { ExamplePuzzles::EASY.first }
  let(:hard_puzzle) { ExamplePuzzles::HARD.first }
  let(:solver) { Solver.new(easy_puzzle[0]) }
  let(:example_board) { easy_puzzle[0].split('') }
  let(:bad_guess_board) { ExamplePuzzles::EASY.last }

  context "helper methods" do
    it "has a board with 81 cells" do
      expect(solver.board.length).to eq(81)
    end

    it "gets 27 members for a cell index" do
      expect(solver.member_cells(example_board, 0).length).to eq(27)
    end

    it "gets all possible moves for a cell" do
      expect(solver.possible_moves(example_board, 1)).to eq(["4", "7"])
    end
  end

end
