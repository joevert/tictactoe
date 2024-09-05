def rounds(tictactoe)
  count = 0

  until count > 8
    player = count.even? ? @player1 : @player2
    puts("It's #{player.name} turn. Choose a number from 1 to 9, left to right, top to bottom")
    play = gets.to_i
    play = convert_play(play, tictactoe)
    next if check_invalid_play(play, tictactoe)

    register_play(play, player, tictactoe)
    print_board(tictactoe)
    return if check_winner(tictactoe, player)

    count += 1
  end
  puts "It's a draw!"
end

def convert_play(play, tictactoe)
  count = 1
  tictactoe.each_with_index do |line, line_index|
    line.each_with_index do |_, column_index|
      if play == count
        play_index = [line_index, column_index]
        return play_index
      else
        count += 1
        if count > 9
          invalid_play_index = [10, 10]
          return invalid_play_index
        end
      end
    end
  end
end

def check_invalid_play(play_index, tictactoe) # rubocop:disable Metrics/AbcSize
  if !(play_index[0].to_i >= 0 && play_index[0].to_i < tictactoe.length
       play_index[1].to_i >= 0 && play_index[1].to_i < tictactoe.length)
    puts 'Invalid number, please try again.'
    true
  elsif tictactoe[play_index[0]][play_index[1]] != ' '
    puts 'This spot already has been taken. Try again.'
    true
  end
end

def register_play(play_index, player, tictactoe)
  tictactoe[play_index[0]][play_index[1]] = player.symbol
end

def check_winner(tictactoe, player)
  (0..2).each do |number|
    next unless ((tictactoe[number][0] == tictactoe[number][1]) && (tictactoe[number][0] == tictactoe[number][2]) && (tictactoe[number][0] != ' ')) ||
                ((tictactoe[0][number] == tictactoe[1][number]) && (tictactoe[0][number] == tictactoe[2][number]) && (tictactoe[0][number] != ' ')) ||
                ((tictactoe[0][0] == tictactoe[1][1]) && (tictactoe[0][0] == tictactoe[2][2]) && (tictactoe[0][0] != ' ')) ||
                ((tictactoe[2][0] == tictactoe[1][1]) && (tictactoe[2][0] == tictactoe[0][2]) && (tictactoe[2][0] != ' '))

    print "We have a winner! Congratulations, #{player.name}!"
    return true
  end
  false
end