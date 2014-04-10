require_relative 'board_printer'
require_relative 'board_utils'

class Solver
  attr_accessor :board 

  def initialize(puzzle)
    @move_count = 1
    @board = puzzle.split('')
    @options ="123456789".split('')
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
