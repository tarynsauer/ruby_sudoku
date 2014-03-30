class BoardPrinter
  attr_accessor :board
  
  def initialize(board)
    @board = board.join('')
  end

  def print_board
    board_string = ""
    index = 0
    board_string += divider 
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

  def divider
    "---------------------\n"
  end
end
