WIN_COMBINATIONS =
[[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[2,4,6]]

#
# #### `#display_board`
# Define a method that prints the current board representation based on the `board` argument passed to the method.
def display_board(board)
puts " #{board[0]} | #{board[1]} | #{board[2]} \n-----------\n #{board[3]} | #{board[4]} | #{board[5]} \n-----------\n #{board[6]} | #{board[7]} | #{board[8]} "
return " #{board[0]} | #{board[1]} | #{board[2]} \n-----------\n #{board[3]} | #{board[4]} | #{board[5]} \n-----------\n #{board[6]} | #{board[7]} | #{board[8]} "
end

# #### `#input_to_index`
# Once the user inputs where they would like to go on the board, we then have to convert this to the board index
# multiple times. Instead of doing that in a lot of places, we can remove this repetitive code and put it in this
# helper method. This method takes the user_input (which is a string), converts it to an Integer, and subtracts 1.
# Remember that, from the player's point of view, the board contains spaces 1-9. But, an array's indexes start their
# count at 0.

#Take players 1-9 input and turn it into a board input 0-8
def input_to_index(input)
  return index = input.to_i - 1
end

# #### `#move`
# Your `#move` method must take in three arguments: **1)** the board array, **2)** the index in the board array that
# the player would like to fill out with an "X" or and "O", and **3)** the player's character (either "X" or "O").
# We previously had you write this method with a default argument of "X" for the third argument, but that is no
# longer needed.
# create a move for player
def move(board, index, character)
  board[index] = character
  turn_count(board)
  display_board(board)
end

# #### `#position_taken?`
# The `#position_taken?` method will be responsible for evaluating the position selected by the user against the
# Tic Tac Toe board and checking to see whether or not that index on the board array is occupied. If the user would
# like to fill out position 1, our `#position_taken?` method will check to see if that board index is vacant or if it
# contains an "X" or an "O". If the position is free, the method should return `false` (i.e. "not taken"), otherwise
# it will return `true`.
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# #### `#valid_move?`
# Build a method `valid_move?` that accepts a board and an index to check and
# returns `true` if the move is valid and `false` or `nil` if not. A valid move means that the submitted position is:
# 1. Present on the game board.
# 2. Not already filled with a token.
#Check for whether the input is a valid move
def valid_move?(board, index)
index.between?(0,8) && !position_taken?(board, index)
en

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
