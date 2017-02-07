module DivideShots

  def divide_list_in_frames(list)
    res = []
    i = 0
    frames_count = 0
    while i < list.size do
      frames_count += 1
      #ultimo frame aggiungi tutti quelli mancanti
      if frames_count == @total_frames
        set_last_frame(i, list, res)
        break
      else
        #strike al primo colpo
        if list[i] == @total_pins
          res << [list[i]]
          i += 1
          #due tiri
        else
          res << [list[i], list[i + 1]]
          i += 2
        end
      end
      increase_pins_if_venus
    end
    res
  end

  def divide_list_in_martian_frames(list)
    res = []
    i = 0
    frames_count = 0
    while i < list.size do
      frames_count += 1
      #ultimo frame aggiungi tutti quelli mancanti
      if frames_count == @total_frames
        set_last_frame(i, list, res)
        break
      end
      #strike al primo colpo
      if list[i] == @total_pins
        res << [list[i]]
        i += 1
      elsif list[i] + list[i + 1] == @total_pins
        res << [list[i], list[i + 1]]
        i += 2
        #tre tiri
      else
        res << [list[i], list[i + 1], list[i + 2]]
        i += 3
      end
      increase_pins_if_venus
    end
    res
  end

  private

  def set_last_frame(i, list, res)
    last_frame = []
    while i < list.size do
      last_frame << list[i]
      i += 1
    end
    res << last_frame
    if @is_venusian_rule
      @total_pins = 1
    end
  end

  def increase_pins_if_venus
    if @is_venusian_rule
      @total_pins += 1
    end
  end

end