module KnightsTravails
  class Knight
    def initialize(cell)
      @current_cell = cell
    end

    def knight_moves(orig, term)
      valid = valid_moves(orig)
    end

    private

    def find_al_coords(input)
      # Takes an array of length 2 input with two integers
      return nil unless input&.length == 2
      return nil unless input&.reduce(:+).between?(2, 16)

      letter = %w[a b c d e f g h]
      number = %w[1 2 3 4 5 6 7 8]

      alpha_i, num_i = input

      "#{letter[alpha_i - 1]}#{number[num_i - 1]}"
    end

    def find_array_coords(input)
      # Takes a string of length 2 and converts it to an array
    end

    def valid_moves(node = @current_cell)
      # This method should generate an edge list from a given node.
      # We can just keep calling this, so this method should just return the
      # set of edges that are next.


    end
  end
end