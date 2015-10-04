module Conway
  class Grid
    def initialize(height:, width:, cell_type:Conway::Cell)
      @height = height
      @width = width
      initialize_grid
      @cell_type = cell_type
    end

    def alive?(x, y)
      get_position(x, y)
    end

    def set_alive(x, y)
      set_position(x, y, true)
    end

    def set_dead(x, y)
      set_position(x, y, false)
    end

    def living_neighbours(x, y)
      enumerate_neighbours(x,y).select do |i, j|
        alive?(i, j)
      end.count
    end

    def update_state
      @position = next_state
      @next_state = nil
    end

    def current_state
      @position
    end

    private

    def next_state
      @next_state ||= begin
        new_position = []
        @position.each_with_index do |column, i|
          new_column = []
          column.each_with_index do |is_alive, j|
            cell = is_alive ? living_cell : dead_cell
            new_column << (cell.next_state(living_neighbours(i, j)) == :alive)
          end
          new_position << new_column
        end
        new_position
      end
    end

    def initialize_grid
      @position = []
      @width.times do
        @position << [false] * @height
      end
    end

    def living_cell
      @living_cell ||= @cell_type.new(alive: true)
    end

    def dead_cell
      @dead_cell ||= @cell_type.new(alive:false)
    end

    def valid_y(y)
      y + 1 <= @height && y >= 0
    end

    def valid_x(x)
      x + 1 <= @width && x >= 0
    end

    def validate_position(x, y)
      raise 'invalid row' unless valid_y(y)
      raise 'invalid column' unless valid_x(x)
    end

    def set_position(x, y, value)
      validate_position(x, y)
      @position[x][y] = value
    end

    def get_position(x, y)
      validate_position(x, y)
      @position[x][y]
    end

    def enumerate_neighbours(x, y)
      rows = [y - 1, y, y + 1].select{|i| valid_y(i) }
      columns = [x - 1, x, x + 1].select{|i| valid_x(i) }
      columns.product(rows).reject{|i, j| i == x && j == y}
    end
  end
end