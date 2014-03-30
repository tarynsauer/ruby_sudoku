class BoardUtils 

  def initialize(board)
    @util_board = board
  end

  def row_values(index)
    row_num = row_index(index) 
    beg_i = row_num * 9
    end_i = beg_i + 8 
    @util_board[beg_i..end_i]
  end

  def col_values(index)
    col = []
    @util_board.each_with_index do |v, i|
      if col_index(i) == col_index(index) 
        col.push(v)
      end
    end
    col
  end 

  def box_values(index)
    box_starting_index = get_box_starting_index(index) 
    get_box_values_by_box_index(box_starting_index)
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
      box += @util_board[box_index..(box_index + 2)]
      box_index += 9
    end
    box
  end

end
