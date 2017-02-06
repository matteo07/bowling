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
    shots_count = 0
    while i < list.size do
      shots_count += 1
      if shots_count == 10
        shoot_last list[i], list[i + 1], list[i + 2] || 0
        break
      end
      if list[i] == 10
        shoot_strike list[i]
        i += 1
      else
        shoot list[i], list[i + 1]
        i += 2
      end
    end
  end

  def shoot_last first, second, last
    if first != 10
      shoot first, second
      if @is_spare
        @total += last
      end
    else
      @total += first + second + last
    end
  end

  def shoot_strike i
    @is_strike = true
    @is_spare = false
    @total += i
  end

  def get_score
    @total
  end

  private

  def shoot_first first
    @total += first
    if @is_spare || @is_strike
      @total += first
    end
  end

  def shoot_second second
    @total += second
    if @first_shot + second == 10
      @is_spare = true
    else
      @is_spare = false
    end
    if @is_strike
      @total += second
      @is_strike = false
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