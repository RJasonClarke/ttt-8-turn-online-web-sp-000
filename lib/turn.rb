def input_to_index(input)
  input.to_i - 1
end

def display_board(board)
  puts " X | O | O "
  puts "-----------"
  puts " X | X | X "
  puts "-----------"
  puts " X | O | X "
end
