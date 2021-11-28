# frozen_string_literal: true

require_relative 'knights_travails/board'
require_relative 'knights_travails/knight'
require_relative 'knights_travails/cell'

def knight_moves(origin, terminal)
  knight = KnightsTravails::Knight.new(origin)
  moves = knight.find_path(origin, terminal)
  puts "You made it in #{moves.length - 1} moves! Here's your path: "
  moves.each_with_index do |move, i|
    puts " -> #{i}: #{move}"
  end

  nil
end
