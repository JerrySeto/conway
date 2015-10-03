module Conway
  class Grid
    def initialize(height:, width:)
      @height = height
      @width = width
      @position = [[false] * width] * height
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

    private
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
      rows.product(columns).reject{|i, j| i == x && j == y}
    end
  end
end