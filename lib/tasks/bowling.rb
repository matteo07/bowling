class Bowling

  def startgame
    @total_pins = 10
    @total_frames = 10
    @score = 0
    @is_spare = false
    @is_strike = false
    @is_two_strike = false
    @is_martian_rule = false
    @is_venusian_rule = false
  end

  def shoot_all list
    if @is_martian_rule
      play_martian(list)
    else
      play_normal(list)
    end
  end

  def get_score
    @score
  end

  def set_martian
    @is_martian_rule = true
    @total_frames = 14
  end

  def set_callisto
    @is_callisto = true
  end

  def set_venusian
    @is_venusian_rule = true
    @total_pins = 1
  end

  private

  def play_normal(list)
    i = 0
    frames_count = 0
    while i < list.size do
      frames_count += 1
      #last frame
      if frames_count == @total_frames
        if @is_callisto
          shoot_last_callisto list, i
          break
        end
        shoot_last_frame list[i], list[i + 1], list[i + 2] || 0
        break
      end
      #strike al primo colpo
      if list[i] == @total_pins
        shoot_strike list[i]
        i += 1
      else
        shoot_frame list[i], list[i + 1]
        i += 2
      end
      if @is_venusian_rule
        @total_pins += 1
      end
    end
  end

  def play_martian(list)
    i = 0
    frames_count = 0
    while i < list.size do
      frames_count += 1
      #last frame
      if frames_count == @total_frames
        if @is_callisto
          shoot_last_callisto list, i
          break
        end
        shoot_last_frame list[i], list[i + 1], list[i + 2], list[i + 3] || 0
        break
      end
      #strike al primo colpo
      if list[i] == @total_pins
        shoot_strike list[i]
        i += 1
      #spare al second colpo
      elsif list[i] + list[i + 1] == @total_pins
        shoot_frame list[i], list[i + 1]
        i += 2
      else
        shoot_frame list[i], list[i + 1], list[i + 2]
        i += 3
      end
    end
  end

  def shoot_first first
    @score += first
    if @is_spare || @is_strike
      @score += first
    end
  end

  def shoot_second second
    @score += second
    if @first_shot + second == @total_pins
      @is_spare = true
    else
      @is_spare = false
    end
    if @is_strike
      @score += second
    end
  end

  def shoot_third(third)
    @score += third
    if @first_shot + @second_shot + third == @total_pins
      @is_spare = true
    else
      @is_spare = false
    end
    if @is_strike
      @score += third
      @is_strike = false
    end
  end

  def shoot_strike i
    @is_strike = true
    @is_spare = false
    @score += i
  end

  def shoot_last_frame first, second, third, last = 0
    @score += first + second + third + last
    if @is_spare
      @score += first
    elsif @is_strike
      @score += first + second + third + last
    end
  end

  def shoot_last_callisto list , i
    while i < list.size do
      @score += list[i]
      i += 1
    end

  end

  def shoot_frame first, second, third = 0
    check_shot first, second
    @first_shot = first
    @second_shot = second
    shoot_first first
    shoot_second second
    shoot_third third
  end

  def check_shot(first, second, third = 0)
    if first > @total_pins
      raise 'first shot over ' + @total_pins.to_s
    elsif second > @total_pins
      raise 'second shot over ' + @total_pins.to_s
    elsif third > @total_pins
      raise 'third shot over ' + @total_pins.to_s
    elsif first + second + third > @total_pins
      raise 'sum over ' + @total_pins.to_s
    end
  end

end