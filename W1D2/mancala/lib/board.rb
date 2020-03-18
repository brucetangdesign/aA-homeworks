class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new }
    @name1 = name1
    @name2 = name2

    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0...@cups.length-1).each {|i| @cups[i] = [:stone,:stone,:stone,:stone] if i != 6 }
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos < 0 || start_pos == 6 || start_pos > 12
    raise 'Starting cup is empty' if @cups[start_pos].length == 0
  end

  def make_move(start_pos, current_player_name)
    cup = @cups[start_pos]
    @cups[start_pos] = []
    next_pos = start_pos

    cup.length.times do
      next_pos = (next_pos + 1 > 13) ? 0 : next_pos + 1
      next_pos += 1 if next_pos == 6 && current_player_name != @name1
      next_pos = 0 if next_pos == 13 && current_player_name != @name2

      @cups[next_pos] << :stone
    end

    render    
    next_turn(next_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx != 6 && ending_cup_idx != 13
      return :switch if @cups[ending_cup_idx].length == 1
      return ending_cup_idx if @cups[ending_cup_idx].length > 1
    else
      return :prompt
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    side_one = @cups[0..5]
    side_two = @cups[7..12]

    return true if side_one.all? { |cup| cup.empty? } || side_two.all? { |cup| cup.empty? }
    false
  end

  def winner
    p1Score = @cups[6].length
    p2Score = @cups[13].length

    return :draw if p1Score == p2Score
    return (p1Score > p2Score) ? @name1 : @name2
  end
end