# frozen_string_literal: true

require './lib/players'
require './lib/board'
require './lib/game'

adquire_players_names

tictactoe = Array.new(3) { Array.new(3, ' ') }

print_board(tictactoe)

rounds(tictactoe)
