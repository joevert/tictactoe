
class Players
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end

def get_players_names
  puts('Type player1 name:')

  player1 = gets.chomp
  @player1 = Players.new(player1, 'X')

  puts("Hi there, #{@player1.name}, you will play with X")

  puts('Type player 2 name:')

  player2 = gets.chomp
  @player2 = Players.new(player2, 'O')

  puts("Hi there, #{@player2.name}, you will play with O")
end

def print_board(tictactoe)
  puts("

_#{tictactoe[0][0]}_|_#{tictactoe[0][1]}_|_#{tictactoe[0][2]}_
_#{tictactoe[1][0]}_|_#{tictactoe[1][1]}_|_#{tictactoe[1][2]}_
 #{tictactoe[2][0]} | #{tictactoe[2][1]} | #{tictactoe[2][2]}

  ")
end

def rounds(tictactoe)
  count = 0

  until count > 8
    player = count.even? ? @player1 : @player2
    puts("It's #{player.name} turn. Choose a number from 1 to 9, left to right, top to bottom")
    play = gets.to_i
    next if check_invalid_play(play)
    register_play(play, player, tictactoe)
    print_board(tictactoe)
    count += 1
  end
end

def register_play(play, player, tictactoe)
  count = 1
  tictactoe.each_with_index do |line, line_index|    
    line.each_with_index do |column, column_index|
      if play == count
        tictactoe[line_index][column_index] = player.symbol
        p tictactoe
        return
      else
        count += 1
      end
    end
  end
end

def check_invalid_play(play)
  if !((1..9).include?(play))
    puts "You played an invalid number. Try again"
  end
end

get_players_names

tictactoe = Array.new(3) { Array.new(3, ' ') }

print_board(tictactoe)

rounds(tictactoe)