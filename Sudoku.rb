class Sudoku
  def initialize(array, hash)
    @array = array
    @hash = hash
  end

  def show
    puts @array.map{|number| puts number.join(' ') }
  end

  def check_is_modifiable(row, column)
    if @hash.has_key?("#{row}#{column}") ? true : false ; end
  end

  def is_filled?
    return true if @array.flatten.count{|cnt| cnt.between?(1,9)} == 81
    return false
  end

  def validate_row(row, number)
     if @array[row].include?(number) ? true : false
     end
  end

  def validate_column(column, number)
    if @array.transpose[column].include?(number) ? true : false
    end
  end

  def validate_grid(row, column, number)
    row_start = (row / 3) * 3
    col_start = (column / 3) * 3
    pos = 0
    9.times do
      return true if @array[row_start + pos % 3][col_start + pos / 3].equal?(number)
      pos += 1
    end
    return false
  end

  def insert_number(row, column, number)
    @array[row][column] = number
    return true
  end
end
