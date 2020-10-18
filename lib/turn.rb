WIN_COMBINATIONS =
[[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[2,4,6]]

def display_board(board)
puts " #{board[0]} | #{board[1]} | #{board[2]} \n-----------\n #{board[3]} | #{board[4]} | #{board[5]} \n-----------\n #{board[6]} | #{board[7]} | #{board[8]} "
return " #{board[0]} | #{board[1]} | #{board[2]} \n-----------\n #{board[3]} | #{board[4]} | #{board[5]} \n-----------\n #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  return index = input.to_i - 1
end

def move(board, index, character)
  board[index] = character
  turn_count(board)
  display_board(board)
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
index.between?(0,8) && !position_taken?(board, index)
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

def full?(board)
  board.none? do |i|
    i == " " || i.nil?
  end
end

def draw?(board)
  won?(board) == nil && full?(board) == true
end

def over?(board)
  draw?(board) == true || won?(board) != nil
end

def winner(board)
  if won?(board) != nil
    winner = board[won?(board)[0]]
  end
end

def play(board)
until over?(board) == true
  turn(board)
end
if draw?(board) == true
  puts "Cats Game!"
else won?(board)
  puts "Congratulations #{winner(board)}!"
end
end
