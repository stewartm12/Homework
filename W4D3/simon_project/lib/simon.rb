class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    puts "Let's play!"

    until @game_over
      self.take_turn
    end 

    self.game_over_message
    self.reset_game
    
  end

  def take_turn
    self.show_sequence
    self.require_sequence

    unless @game_over 
      self.round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color

    @seq.each do |color|
      system("clear")
      puts color
      sleep(1)
      system("clear")
    end
  end

  def require_sequence
    puts "Enter a color on each new line"
    @seq.each do |color|
      user = gets.chomp
      if user != color 
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Good job! On to the next one"
  end

  def game_over_message
    puts "Better luck next time!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false 
    @seq = []
  end
end
