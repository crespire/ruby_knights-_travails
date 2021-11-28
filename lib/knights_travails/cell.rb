# frozen_string_literal: true

module KnightsTravails
  class Cell
    attr_accessor :name, :neighbours

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
