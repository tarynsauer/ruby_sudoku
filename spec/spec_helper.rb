require_relative '../lib/board_printer'
require_relative '../lib/solver'
require_relative '../lib/board_utils'
require_relative '../lib/example_puzzles'

def test_solve(puzzle)
  solver = Solver.new(puzzle[0])
  expect(print_puzzle(solver.solve)).to eq(print_puzzle(puzzle[1]))
end

def print_puzzle(board)
  board_string = "\n"
  index = 0
  board_string += divider
  board = fill_in_empty_cells(board)
    while index < 81 do
      board_string += board[index..(index + 2)].split('').join(' ') + " | "
      board_string += board[(index + 3)..(index + 5)].split('').join(' ') + " | "
      board_string += board[(index + 6)..(index + 8)].split('').join(' ')
      board_string += "\n"
      index += 9
      if (index % 27) == 0
        board_string += divider
      end
    end
    board_string + "\n"
end

def fill_in_empty_cells(board)
  if board.length < 81
    diff = 81 - board.length
    board = board + ("-" * diff)
  end
  board
end

def divider
  "---------------------\n"
end

def solve_puzzle_test(puzzle)
  solver = Solver.new(puzzle[0])
  expect(solver.solve).to eq(puzzle[1]), "Expected: #{print_puzzle(solver.solve)} Got: #{print_puzzle(puzzle[1])}"
end

