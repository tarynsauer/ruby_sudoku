class Sudoku
   attr_accessor :board, :options, :move_count

  def initialize(puzzle)
     @options = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
     @board = puzzle.split('')
     @move_count = 0
  end

  def solve!
    start_solving_message
    while unsolved? 
      board.each_with_index do |value, index|
        make_move_if_possible(value, index)
      end
    end
    solved_puzzle_message
  end

  def make_move_if_possible(value, index)
    if (open_space?(value) && make_move?(index))
      place_value_on_board(index)
    end
  end

  def place_value_on_board(index)
    move = possible_moves(index).first 
    board[index] = move
    @move_count += 1
  end

  def row_values(index)
    row_num = row_index(index) 
    beg_i = row_num * 9
    end_i = beg_i + 8 
    board[beg_i..end_i]
  end

  def col_values(index)
    col = []
    board.each_with_index do |v, i|
      if col_index(i) == col_index(index) 
        col << v
      end
    end
    col
  end 

  def make_move?(index)
    possible_moves(index).length == 1  
  end

  def print_board
    printer = Board.new(board)
    puts printer.print_board
  end

  def box_values(index)
    box_starting_index = get_box_starting_index(index) 
    get_box_values_by_box_index(box_starting_index)
  end

  def possible_moves(index)
    options - all_taken_values(index)
  end

  def all_taken_values(index)
    all_values = row_values(index) + col_values(index) + box_values(index)
    all_values.delete("0")
    all_values.uniq!
  end

  private
  
  def start_solving_message
    puts "\nStarting board:"
    print_board
  end

  def solved_puzzle_message
    puts "\nSolved puzzle in #{move_count} moves."
    print_board
  end

  def unsolved?
    board.include?("0")
  end

  def open_space?(value)
    value == "0" 
  end

  def row_index(index)
    index / 9
  end

  def col_index(index)
    index % 9
  end

  def get_box_starting_index(index)
    (27 * (index / 27)) + (3 * box_col_number(index))
  end

  def box_col_number(index)
    (col_index(index)) / 3
  end

  def get_box_values_by_box_index(box_index) 
    box = []
    3.times do
      box += board[box_index..(box_index + 2)]
      box_index += 9
    end
    box
  end

end
