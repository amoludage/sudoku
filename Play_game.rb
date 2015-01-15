require "./User"
require "./Sudoku"
class Play_game
=begin  def set_flag(array, hash)
    row = 0
    col = 0
    9.times do
      9.times do
        hash["#{row}#{col}"] = 1 if array[row][col] > 0
        row += 1 ; col += 1
      end
    end
  end
=end
end
array =[
    [6, 0, 2, 0, 1, 9, 0, 0, 4],[0, 7, 3, 8, 2, 4, 5, 0, 1],
    [0, 0, 1, 7, 6, 0, 3, 2, 0],[9, 0, 0, 0, 0, 0, 6, 8, 3],
    [0, 0, 0, 0, 4, 0, 0, 0, 0],[2, 1, 5, 0, 0, 0, 0, 0, 7],
    [0, 6, 9, 0, 8, 3, 2, 0, 0],[1, 0, 4, 5, 7, 6, 8, 0, 0],
    [5, 0, 0, 1, 9, 0, 4, 0, 2]]

hash = Hash.new
#p = Play_game.new
#p.set_flag(array, hash)
sudoku = Sudoku.new(array, hash)
user = User.new(sudoku)
user.take_user_input
