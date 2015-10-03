module Conway
  class Cell
    def initialize(alive: false)
      @alive = alive
    end

    def alive?
      @alive
    end

    def current_state
      alive? ? :alive : :dead
    end

    def next_state(num_neighbours)
      raise 'invalid number of neighbours' if num_neighbours < 0
      return :alive if !alive? && num_neighbours == 3
      return :alive if alive? && (num_neighbours == 2 || num_neighbours == 3)
      :dead
    end
  end
end