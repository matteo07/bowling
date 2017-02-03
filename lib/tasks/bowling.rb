class Bowling

  def startgame
    @total = 0
    p "Game started"
  end

  def shoot x
    @total += x
  end

  def get_score
    @total
  end
end