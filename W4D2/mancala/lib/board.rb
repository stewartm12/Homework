class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { [] }
    self.place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, idx|
      unless idx == 6  || idx == 13
        4.times { cup << :stone }
      end
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos > 12
    raise 'Starting cup is empty' if start_pos == 0
  end

  def make_move(start_pos, current_player_name)
     stones = @cups[start_pos]
     @cups[start_pos] = []
 
     idx = start_pos
     while !stones.empty?
       idx += 1
       idx = 0 if idx > 13

       if idx == 6 
         @cups[6] << stones.pop if current_player_name == @name1
       elsif idx == 13
         @cups[13] << stones.pop if current_player_name == @name2
       else
         @cups[idx] << stones.pop
       end
     end
 
     render
     next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].length == 1
      return :switch
    elsif @cups[ending_cup_idx].length != 0
      return ending_cup_idx
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
    side1 = @cups[0..5].all? { |cup| cup.empty? }
    side2 = @cups[7..12].all? { |cup| cup.empty? }
    
    return true if side1 || side2
    false
  end

  def winner
    count1 = @cups[6].length
    count2 = @cups[13].length

    if count1 == count2
      :draw
    elsif  count1 > count2
      @name1
    else  
      @name2
    end
  end
end
