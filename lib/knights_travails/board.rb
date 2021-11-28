# frozen_string_literal: true

module KnightsTravails
  class Board
    attr_accessor :board

    def initialize
      @board = []

      letter = %w[a b c d e f g h]
      number = %w[1 2 3 4 5 6 7 8]

      letter.each do |l|
        number.each do |n|
          @board << Cell.new("#{l}#{n}")
        end
      end
    end

    def find(value)
      @board.each { |node| return node if node.name == value }
    end
  end
end
