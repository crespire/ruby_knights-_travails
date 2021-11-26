module KnightsTravails
  class Cell
    attr_accessor :name

    def initialize(name)
      @name = name
      @piece = nil
    end

    def empty?
      @piece.nil?
    end
  end
end