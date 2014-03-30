require_relative 'board_printer'
require_relative 'board_utils'

class Solver
  attr_accessor :board, :move_count, :options, :begin_board, :precision

  def initialize(puzzle)
    @puzzle = puzzle
    @options = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
    @board = puzzle.split('')
    @move_count = 0
    @precision = 1
  end

  def solve!
    until solved? 
    @begin_board = @board.dup
      @board.each_with_index do |value, index|
        make_move_if_possible(value, index) if open_space?(value)
      end
      guess_if_necessary
    end
    @board.join('') 
  end
  
  def guess_if_necessary
    @begin_board == @board ? @precision += 1 : @precision = 1
  end

  def make_move_if_possible(value, index)
    moves = possible_moves(index)
    if moves.length <= @precision 
      place_value_on_board(moves, index)
      @precision = 1
    end
  end

  def place_value_on_board(moves, cell_index)
    if moves.length.zero?
      @board = @puzzle.split('') 
      @precision = 1 
    else
      move = moves.shuffle.first
      @board[cell_index] = move
      @move_count += 1
    end
  end
  
  def solved?
    !@board.include?("0")
  end

  def open_space?(value)
    value == "0" 
  end

  def possible_moves(index)
    @options - all_taken_values(index) 
  end

  def all_taken_values(index)
    util = BoardUtils.new(@board)
    all_values = util.row_values(index) + util.col_values(index) + util.box_values(index)
    all_values.delete("0")
    all_values.uniq
  end

  def print_board
    printer = BoardPrinter.new(@board)
    puts printer.print_board
  end

  def start_solving_message(count)
    puts "\n ***** Puzzle ##{count} *****"
    print_board
  end

  def end_solving_message(seconds)
    puts "Solved in #{seconds}s and #{@move_count} moves"
    print_board
  end

end
