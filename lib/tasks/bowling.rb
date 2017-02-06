class Bowling

  def startgame
    @total = 0
    @is_spare = false
    @is_strike = false
    @is_two_strike = false
    p "Game started"
  end

  def shoot first, second
    check_shot first, second
    @first_shot = first
    shoot_first first
    shoot_second second
  end

  def shoot_all list
    i = 0
    while i < list.size do
      shoot list[i], list[i + 1]
      i += 2
    end
  end

  def get_score
    @total
  end

  private

  def shoot_first first
    @total += first
    if @is_spare
      @total += first
    end
  end

  def shoot_second second
    @total += second
    if @first_shot + second == 10
      @is_spare = true
    elsif
      @is_spare = false
    end
  end

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