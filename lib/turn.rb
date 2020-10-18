puts "Please enter 1-9:"

def input
  gets.chomp
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end


def input_to_index(input)
  input.to_i - 1
end

def display_board(board)
puts " #{board[0]} | #{board[1]} | #{board[2]} \n-----------\n #{board[3]} | #{board[4]} | #{board[5]} \n-----------\n #{board[6]} | #{board[7]} | #{board[8]} "
return " #{board[0]} | #{board[1]} | #{board[2]} \n-----------\n #{board[3]} | #{board[4]} | #{board[5]} \n-----------\n #{board[6]} | #{board[7]} | #{board[8]} "
end

def move

end
