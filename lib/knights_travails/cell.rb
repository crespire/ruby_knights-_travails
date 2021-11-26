module KnightsTravails
  class Cell
    def initialize(name)
      @name = name
      @piece = nil
    end

    def occupied?
      @piece.nil?
    end
  end
end