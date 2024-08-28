

class Players
  attr_reader :name
  def initialize (name)
    @name = name
  end
end

def get_players_names

  puts ("Type player1 name (X):")

  player1 = gets.chomp
  player1 = Players.new(player1)

  puts ("Hi there, #{player1.name}, you will play with X")

  puts ("Type player 2 name (O):")

  player2 = gets.chomp
  player2 = Players.new(player2)

  puts ("Hi there, #{player2.name}, you will play with O")

end

def draw_board(tictactoe)
  puts("

_#{tictactoe[0][0]}_|_#{tictactoe[0][1]}_|_#{tictactoe[0][2]}_
_#{tictactoe[1][0]}_|_#{tictactoe[1][1]}_|_#{tictactoe[1][2]}_
 #{tictactoe[2][0]} | #{tictactoe[2][1]} | #{tictactoe[2][2]}   

  ")
end

# get_players_names

tictactoe = Array.new(3) {Array.new(3,"  ")}

draw_board(tictactoe)


