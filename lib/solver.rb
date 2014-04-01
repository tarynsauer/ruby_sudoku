require_relative 'board_printer'
require_relative 'board_utils'

class Solver
  attr_accessor :board, :begin_board, :precision, :move_count
  MAX_COUNT = 10000

  def initialize(puzzle)
    @puzzle = puzzle
    @board = puzzle.split('')
    @options = "123456789".split('') 
    @precision = 1
    @move_count = 0 
  end

  def solve!
    until solved?
      @begin_board = @board.dup
      find_potential_moves
      guess_if_neccessary
      return @board.join('') if @move_count > MAX_COUNT 
    end
    @board.join('')
  end

  def find_potential_moves
    @board.each_with_index { |v, i| try_move(i) if open_cell?(v) }
  end

  def guess_if_neccessary
    if @begin_board == @board
      @precision += 1
    end
  end

  def possible_moves(index)
    @options - member_values(index)
  end

  def member_values(index)
    util = BoardUtils.new(@board)
    util.row_values(index) + util.box_values(index) + util.col_values(index)
  end

  def try_move(index)
    moves = possible_moves(index)
    if moves.length <= @precision
      make_move(moves, index) 
      @precision = 1
    end
  end

  def make_move(moves, index)
    if moves.empty?
      @board = @puzzle.split('')
    else 
      @board[index] = moves.shuffle.first
      @move_count += 1
    end
  end

  def solved?
    !@board.include?("0")
  end

  def open_cell?(value)
    value == "0"
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
