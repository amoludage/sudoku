require "./Exception"
require "./Sudoku"

class Player
  def initialize(sudoku, player_name)
    @sudoku = sudoku
    @player_name = player_name
  end

  def take_user_input
    @sudoku.show
    if !@sudoku.is_filled?
      begin
        puts "Enter the Row position: "
        row = validate_row_input(gets.chomp.to_i)
        puts "Enter the Column position: "
        column = validate_column_input(gets.chomp.to_i)
        puts "Enter the number you want to put at above position: "
        number = validate_number_input(gets.chomp.to_i)

        check_positions(row, column, number)

      rescue InvalidRowError => e
        puts e.message
        retry
      rescue InvalidColumnError => e
        puts e.message
        retry
      rescue InvalidNumberError => e
        puts e.message
        retry
      end
    end
    puts "Congrats #{@player_name} you won the game"
  end


  def validate_row_input(row)
    if row.nil? || !row.between?(1,9)
      raise InvalidRowError, "Invalid Row.."
    end
    return row
  end

  def validate_column_input(column)
    if column.nil? || !column.between?(1,9)
      raise InvalidColumnError, "Invalid Column.."
    end
    return column
  end

  def validate_number_input(number)
    if number.nil? || !number.between?(1,9)
      raise InvalidNumberError, "Invalid number.."
    end
    return number
  end

  def check_positions(row, column, number)
    val_row = @sudoku.validate_row(row-1, number)
    val_column =  @sudoku.validate_column(column-1, number)
    val_grid = @sudoku.validate_grid(row-1, column-1, number)

    if @sudoku.check_is_modifiable?(row - 1, column - 1)
      puts "Already their is number"
      take_user_input
    elsif val_row || val_column || val_grid
      puts "Invalid number at this position.."
      take_user_input
    else
      @sudoku.insert_number(row - 1, column - 1, number)
      take_user_input
    end
  end
end
