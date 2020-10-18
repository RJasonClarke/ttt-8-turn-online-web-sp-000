def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} \n-----------\n #{board[3]} | #{board[4]} | #{board[5]} \n-----------\n #{board[6]} | #{board[7]} | #{board[8]} "
return " #{board[0]} | #{board[1]} | #{board[2]} \n-----------\n #{board[3]} | #{board[4]} | #{board[5]} \n-----------\n #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def move(board, index, player)
  board[index] = player
  turn_count(board)
  display_board(board)
end

def turn_count(board)
count = 0
board.each do |play|
  if play == "X" || play == "O"
  count += 1
  end
end
count
end

def turn(board)
puts "Please enter 1-9:"
input = gets.strip
input_to_index(input)
m = valid_move?(board, index)
  if m == true
    player = current_player(board)
    move(board, index, player)
  else m == nil
    puts "Sorry, that was an invalid move. Please enter 1-9:"
    display_board(board)
    # turn(board)
    input = gets.strip
    index = input_to_index(input)
    m = valid_move?(board, index)
  end
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end
