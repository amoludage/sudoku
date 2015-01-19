require "./Player"
require "./Sudoku"

class Play_game
end

array =[
    [0, 0, 2, 0, 1, 9, 0, 0, 4],[0, 7, 3, 8, 2, 4, 5, 0, 1],
    [0, 0, 1, 7, 6, 0, 3, 2, 0],[9, 0, 0, 0, 0, 0, 6, 8, 3],
    [0, 0, 0, 0, 4, 0, 0, 0, 0],[2, 1, 5, 0, 0, 0, 0, 0, 7],
    [0, 6, 9, 0, 8, 3, 2, 0, 0],[1, 0, 4, 5, 7, 6, 8, 0, 0],
    [5, 0, 0, 1, 9, 0, 4, 0, 2]]

hash = Hash.new
puts "Enter your name :"
name = gets.chomp
sudoku = Sudoku.new(array, hash)
sudoku.generate_flag
player = Player.new(sudoku, name)
player.take_user_input

#colj
