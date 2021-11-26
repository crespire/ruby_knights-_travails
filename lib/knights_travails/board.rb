module KnightsTravails
  require_relative 'cell'

  class Board
    attr_accessor :board

    def initialize
      @board = {}

      letter = %w[a b c d e f g h]
      number = %w[1 2 3 4 5 6 7 8]

      letter.each do |l|
        number.each do |n|
          @board["#{l}#{n}".to_sym] = Cell.new("#{l}#{n}")
        end
      end
    end
  end
end