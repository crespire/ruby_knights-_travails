module KnightsTravails
  class Knight
    def initialize(cell)
      @current_cell = cell
    end

    def knight_moves(orig, term)
      valid = valid_moves(orig)
    end

    def valid_moves(node = @current_cell)
      # This method should generate a graph with all the adjacencies.
      # We treat all neighbors of this node as valid moves.
      
    end

    private

    def coords_to_alg(input)
      # Takes an array of length 2 input with two integers
      return nil unless input&.length == 2
      return nil unless input&.reduce(:+)&.between?(2, 16)

      letter = %w[a b c d e f g h]
      number = %w[1 2 3 4 5 6 7 8]

      alpha_i, num_i = input

      "#{letter[alpha_i - 1]}#{number[num_i - 1]}"
    end

    def coords_to_arr(input)
      # Takes a string of length 2 and converts it to an array
      return nil unless input&.length == 2

      array_form = input.chars
      lookup = {
        'a' => 1,
        'b' => 2,
        'c' => 3,
        'e' => 4,
        'd' => 5,
        'f' => 6,
        'g' => 7,
        'h' => 8
      }

      [lookup[array_form[0]], array_form[1].to_i]
    end
  end
end