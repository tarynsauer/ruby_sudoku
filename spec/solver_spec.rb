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

  context "algorithm helpers" do
    it "begins guessing when there's no possible moves" do
      solver.guess_if_neccessary(example_board, example_board)
      expect(solver.precision).to eq(2)
    end

    it "stops guessing after making a guess move" do
      solver.guess_if_neccessary(example_board, example_board)
      solver.try_move(example_board, 1)
      expect(solver.precision).to eq(1)
    end
    
    it "resets the board when there are no possible moves for a given cell" do
      test_board = solver.make_move(bad_guess_board, [], 1)
      expect(test_board).to eq(example_board)
    end
  end

  context "#solve puzzles" do
    def solve_puzzle_test(puzzle)
      solver = Solver.new(puzzle[0])
      expect(solver.solve).to eq(puzzle[1]), "Expected: #{print_puzzle(solver.solve)} Got: #{print_puzzle(puzzle[1])}"
    end

    it "solves a puzzle with one open cell" do
      solve_puzzle_test(very_easy_puzzle)
    end

    it "solves an easy-level puzzle" do
      solve_puzzle_test(easy_puzzle)
    end
  
    it "solves an hard-level puzzle" do
      solve_puzzle_test(hard_puzzle)
    end
  end
end
