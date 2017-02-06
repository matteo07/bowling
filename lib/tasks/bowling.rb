class Bowling

  def startgame
    @total = 0
    @is_spare = false
    @is_strike = false
    p "Game started"
  end

  def single_shoot x
    @total += x
  end

  def shoot_array list
    list.each do |x|
      @total += x
    end

  end

  def get_score
    @total
  end

  private

  def check_shot(first, second)
    if first > 10
      raise "first shot over 10"
    end
    if second > 10
      raise "second shot over 10"
    end
    if first + second > 10
      raise "sum over 10"
    end
  end
end