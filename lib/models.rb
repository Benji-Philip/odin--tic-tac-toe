# Holds the moves the players makes
class Player
  def initialize
    @moves = []
  end

  def add_move(number)
    @moves.push(number.to_i)
  end

  def moves
    @moves
  end
end

# Holds the moves the computer makes
class Computer < Player
end

# Defines what is in a round of tic-tac-toe
class ThisRound
  def initialize()
    @grid = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    @rcd_grid = [[[0, 1, 2], [3, 4, 5], [6, 7, 8]], [[0, 3, 6], [1, 4, 7], [3, 5, 8]], [[0, 4, 8], [2, 4, 6]]]
    # arrays rows columns diagnals
    @won = false
    @lost = false
    @player = Player.new
    @computer = Computer.new
  end

  def remove_move(number)
    @grid.delete(number.to_i)
  end

  def check_win()
    @rcd_grid.each do |array_of_arrays|
      array_of_arrays.each do |array|
        if (@player.moves & array).sort == array.sort
          @won = true
        elsif (@computer.moves & array).sort == array.sort
          @lost = true
        end
      end
    end
  end

  def display_grid()
    rows_array = ["[0, 1, 2]", "[3, 4, 5]", "[6, 7, 8]"]
    rows_array.each do |str|
      @player.moves.each { |number| str.sub!("#{number}", "x") }
      @computer.moves.each { |number| str.sub!("#{number}", "o") }
      puts str
    end
  end

  def play_turn(number)
    if !@grid.empty?
      @player.add_move(number)
      remove_move(number)
      check_win
      computer_move = @grid.sample
      @computer.add_move(computer_move)
      remove_move(computer_move)
      check_win
    end
    display_grid
  end

  def round_status
    [@won, @lost]
  end

  def grid
    @grid
  end
end
