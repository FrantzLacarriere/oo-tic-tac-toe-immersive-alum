class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(input, char = "X")
    @board[input_to_index(input)] = char
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def position_taken?(position)
    @board[position] == "X" || @board[position] == "O"
  end

  def valid_move?(move)
    idx = input_to_index(move)
    idx.between?(0,8) && !position_taken?(idx)
  end

  def turn
    puts "Enter a number between 1 - 9"
    input = gets.strip

    turn if !valid_move?(input)

    move(input, current_player)
    display_board
  end

  def turn_count
    @board.count{ |cell| cell == "X" || cell == "O" }
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |arr|
      arr.all? { |idx| @board[idx] == "X" } ||
      arr.all? { |idx| @board[idx] == "O" }
    end
  end

  def full?
    turn_count == 9
  end

  def draw?
    full?  && !won?
  end

  def over?
    !!won? || draw?
  end

  def winner
    @board[won?[0]] if !!won?
  end

  def play
    until over?
      turn
    end

    puts !!won? ? "Congratulations #{winner}!" : "Cats Game!"
  end

end
