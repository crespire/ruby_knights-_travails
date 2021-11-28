module KnightsTravails
  class Cell
    attr_accessor :name

    def initialize(name)
      @name = name
      @piece = nil
      @neighbours = []
    end

    def empty?
      @piece.nil?
    end

    def add_neighbour(name)
      @neighbours << name
    end
  end
end