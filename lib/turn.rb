puts "Please enter 1-9:"

def input
  gets.chomp
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def move(board, index, character)
  board[index] = character
  turn_count(board)
  display_board(board)
end

def turn(board)
  puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    m = valid_move?(board, index)
  if m == true
    character = current_player(board)
    move(board, index, character)
  else m == nil
    puts "Sorry, that was an invalid move. Please enter 1-9:"
    display_board(board)
    # turn(board)
    input = gets.strip
    index = input_to_index(input)
    m = valid_move?(board, index)
  end
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

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.find do |win_combination|
    board[win_combination[0]] == board[win_combination[1]] && board[win_combination[0]] == board[win_combination[2]] && position_taken?(board, win_combination[0])
  end
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
