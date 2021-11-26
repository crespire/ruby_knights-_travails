module KnightsTravails
  class Cell
    def initialize(name)
      @name = name
      @piece = nil
    end

    def empty?
      @piece.nil?
    end
  end
end