require_relative "lib/models"

# gets player input in command terminal
# players can choose to start as O or X
# X always starts first
# computer places arandomly
# checking the game to make sure there are any matching rows or diagonals that ends the game
# if all grids are full and there are no diagonals the game ends
# grid represented by an array = [0,1,2,3,4,5,6,7,8]
#   rows = [0,1,2][3,4,5][6,7,8] colums = [0,3,6][1,4,7][3,5,8] diagonals = [0,4,8][2,4,6]
# players choice takes it out of the array and so does computers choice
# for win
#   player or computer array must have all the numbers of either row column or diagonals

puts "[0,1,2]\n[3,4,5]\n[6,7,8]"
puts "enter where to play x :"
player_input = gets.chomp
puts ""
until player_input.to_i.between?(0, 8)
  puts "Invalid input"
  player_input = gets.chomp
end
game = ThisRound.new()
game.play_turn(player_input)
until game.round_status.include?(true) || game.grid.empty?
  puts "next :"
  player_input = gets.chomp
  puts ""
  until player_input.to_i.between?(0, 8) && game.grid.include?(player_input.to_i)
    puts "Invalid input"
    player_input = gets.chomp
  end
  game.play_turn(player_input)
end
