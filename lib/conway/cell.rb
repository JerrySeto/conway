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
  end
end