class Sudoku
  def initialize(array, hash)
    @array = array
    @hash = hash
  end

  def show
    @array.map{|number| puts number.join(' ') }
  end

  def check_is_modifiable?(row, column)
    if @hash.key?("#{row}#{column}")
      return true
    else
      return false
    end
  end

  def is_filled?
    return true if @array.flatten.count{|cnt| cnt.between?(1,9)}.equal?(81)
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

  def generate_flag
    row = 0
    9.times do
      col = 0
      9.times do
        @hash["#{row}#{col}"] = 1 if (@array[row][col] > 0)
        col += 1
      end
      row += 1
    end
    return
  end
end
