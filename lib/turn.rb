def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


board = [" "," "," "," "," "," "," "," "," "]

WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def input_to_index(user_input)
  user_input.to_i - 1
end


def move(board, position, char)
  board[position] = char
end


def position_taken?(board, index_i)
  ((board[index_i] == "X") || (board[index_i] == "O"))
end


def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end


def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    char = current_player(board)
    if valid_move?(board, index)
      move(board, index, char)
      display_board(board)
    else
      turn(board)
    end
end


def turn_count(board)
  number_of_turns = 0
  board.each do |space|
    if space == "X" || space == "O"
      number_of_turns += 1
    end
  end
  return number_of_turns
end


def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end


def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    if (board[win_combo[0]]) == "X" && (board[win_combo[1]]) == "X" && (board[win_combo[2]]) == "X"
      return win_combo
    elsif (board[win_combo[0]]) == "O" && (board[win_combo[1]]) == "O" && (board[win_combo[2]]) == "O"
      return win_combo
    end
      false
  end
end

def full?(board)
  board.all?{|occupied| occupied != " "}
end


def draw?(board)
  !(won?(board)) && (full?(board))
end

def over?(board)
  (won?(board)) || (full?(board)) || (draw?(board))
end


def winner(board)
  WIN_COMBINATIONS.detect do |win_combo|
    if (board[win_combo[0]]) == "X" && (board[win_combo[1]]) == "X" && (board[win_combo[2]]) == "X"
      return "X"
    elsif (board[win_combo[0]]) == "O" && (board[win_combo[1]]) == "O" && (board[win_combo[2]]) == "O"
      return "O"
    else
      nil
    end
  end
end


def play(board)
  while over?(board) == false
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end



require_relative '../lib/tic_tac_toe'

puts 'Welcome to Tic Tac Toe!'

board = [" "," "," "," "," "," "," "," "," "]

play(board)
