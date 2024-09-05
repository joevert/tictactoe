class Players
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end

def adquire_players_names
  puts('Type player1 name:')

  player1 = gets.chomp
  @player1 = Players.new(player1, 'X')

  puts("Hi there, #{@player1.name}, you will play with X")

  puts('Type player 2 name:')

  player2 = gets.chomp
  @player2 = Players.new(player2, 'O')

  puts("Hi there, #{@player2.name}, you will play with O")
end
