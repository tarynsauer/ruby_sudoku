require_relative 'board_printer'
require_relative 'board_utils'

class Solver
  attr_accessor :board, :precision
  EMPTY_CELL = "0"
  def initialize(puzzle)
    @move_count = 1
    @board = puzzle.split('')
    @options ="123456789".split('')
    @precision = 1
  end

  def solve
    test_board = @board.dup
    while test_board.include?(EMPTY_CELL)
      begin_board = test_board.dup
      test_board.each_with_index do |value, index|
        test_board = try_move(test_board, index) if value == EMPTY_CELL
      end
      guess_if_neccessary(test_board, begin_board)
    end
    get_completed_puzzle(test_board) 
  end 

  def guess_if_neccessary(test_board, begin_board)
    if test_board == begin_board
      @precision += 1
    end
  end

  def try_move(test_board, index)
    moves = possible_moves(test_board, index) 
    if moves.length <= @precision 
      test_board = make_move(test_board, moves, index)
      @precision = 1
    end
    test_board
  end


  def make_move(test_board, moves, index)
    if moves.empty?
      test_board = @board.dup
    else
      test_board[index] = moves.shuffle.first
      @move_count += 1
    end
    test_board
  end

  def get_completed_puzzle(test_board)
    @board = test_board
    test_board.join('')
  end

  def possible_moves(test_board, index)
    @options - member_cells(test_board, index)
  end

  def member_cells(test_board, index)
    util = BoardUtils.new(test_board)
    util.row_values(index) + util.col_values(index) + util.box_values(index)
  end

  def end_solving_message(time)
    printer = BoardPrinter.new(@board)
    puts "Solved in #{time}s and #{@move_count} moves" 
    puts printer.print_board
  end

  def start_solving_message(count)
    printer = BoardPrinter.new(@board)
    puts "******* Puzzle ##{count} ********"
    puts printer.print_board
  end
end
