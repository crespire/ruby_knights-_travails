module KnightsTravails
  require_relative 'board'

  class Knight
    def initialize(cell)
      @current_cell = cell
    end

    def knight_moves(orig, term)
      valid = valid_moves
      # BFS to terminal node from origin
    end

    def valid_moves(graph = KnightsTravails::Board.new)
      # This method should generate a graph with all the adjacencies.
      # We treat all neighbors of this node as valid moves.

      # For each node, add all valid neighbours to neighbors.
      graph.board.each do |node|
        coords_arr = coords_to_arr(node.name)

        north = coords_arr[1] + 2
        if north.between?(1, 8)
          ns_right = coords_arr[0] + 1
          ns_left = coords_arr[0] - 1
          right = [ns_right, north]
          left = [ns_left, north]
          node.add_neighbour(coords_to_alg(left)) if ns_left.between?(1, 8)
          node.add_neighbour(coords_to_alg(right)) if ns_right.between?(1, 8)          
        end

        east = coords_arr[0] + 2
        if east.between?(1, 8)
          ew_up = coords_arr[1] + 1
          ew_down = coords_arr[1] - 1
          up = [east, ew_up]
          down = [east, ew_down]
          node.add_neighbour(coords_to_alg(up)) if ew_up.between?(1, 8)
          node.add_neighbour(coords_to_alg(down)) if ew_down.between?(1, 8)
        end

        south = coords_arr[1] - 2
        if south.between?(1, 8)
          ns_right = coords_arr[0] + 1
          ns_left = coords_arr[0] - 1
          right = [ns_right, south]
          left = [ns_left, south]
          node.add_neighbour(coords_to_alg(right)) if ns_right.between?(1, 8)
          node.add_neighbour(coords_to_alg(left)) if ns_left.between?(1, 8)
        end

        west = coords_arr[0] - 2
        if west.between?(1, 8)
          ew_up = coords_arr[1] + 1
          ew_down = coords_arr[1] - 1
          up = [west, ew_up]
          down = [west, ew_down]
          node.add_neighbour(coords_to_alg(down)) if ew_down.between?(1, 8)
          node.add_neighbour(coords_to_alg(up)) if ew_up.between?(1, 8)
        end
      end

      graph
    end

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
        'd' => 4,
        'e' => 5,
        'f' => 6,
        'g' => 7,
        'h' => 8
      }

      [lookup[array_form[0]], array_form[1].to_i]
    end
  end
end