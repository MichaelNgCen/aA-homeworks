class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    while game_over == false
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if game_over == false
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    puts @seq
  end

  def require_sequence
    puts "Enter the sequence one color at a time:"
    input = gets.chomp
    if input != @seq.join(" ")
      @game_over = true
      game_over_message
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Round success!"
  end

  def game_over_message
    puts "Game over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
