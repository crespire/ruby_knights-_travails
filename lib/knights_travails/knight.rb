module KnightsTravails
  class Knight
    def initialize(cell)
      @current_cell = cell
    end

    def find_path(orig = @current_cell, term = nil)
      board = valid_moves

      bfs_info = {}
      board.board.each do |node|
        bfs_info[node.name] = { distance: nil, predecessor: nil }
      end

      queue = []
      queue.push(orig)
      distance = 0
      until queue.empty?
        current = board.find(queue.shift)
        if bfs_info[current.name][:distance].nil?
          bfs_info[current.name][:distance] = distance
        else
          distance = bfs_info[current.name][:distance]
        end
        current.neighbours.each do |name|
          next unless bfs_info[name][:distance].nil?

          bfs_info[name][:distance] = distance + 1
          bfs_info[name][:predecessor] = current.name
          queue << name
        end

        break if queue.include?(term)
      end

      output = []
      path_current = term
      until path_current == orig
        output << path_current
        path_current = bfs_info[path_current][:predecessor]
      end
      output << orig
      output.reverse
    end

    def valid_moves(graph = KnightsTravails::Board.new)
      # For each node, add all valid neighbours.
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
