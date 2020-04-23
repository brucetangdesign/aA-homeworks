require "colorize"

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []

  end

  def play
    take_turn until @game_over
    
    if @game_over
      system("clear")
      game_over_message
      reset_game
    end
  end

  def take_turn
    show_sequence
    sleep(2)
    system("clear")
    require_sequence
    
    if !@game_over
      round_success_message
      @sequence_length += 1
      sleep(1)
      system("clear")
    end
  end

  def show_sequence
    add_random_color
    
    @seq.each { |col| puts col.colorize(col.to_sym)}
  end

  def require_sequence
    step_num = 0
    
    (0...@sequence_length).each do |i|
      puts "Type the next color:"
      ans = gets.chomp
      if ans != @seq[i]
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts ""
    puts "#".ljust(20,"#")
    puts ""
    puts "GOOD JOB"
    puts ""
    puts "#".ljust(20,"#")
  end

  def game_over_message
    puts ""
    puts "#".ljust(20,"#")
    puts ""
    puts "GAME OVER"
    puts ""
    puts "#".ljust(20,"#")
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

s = Simon.new
s.play
