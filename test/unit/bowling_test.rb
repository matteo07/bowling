require_relative '../test_case'

class BowlingTest < Test::Unit::TestCase

  def test_all_zeros
    @bowling = Bowling.new
    @bowling.startgame
    20.times do
      @bowling.shoot 0
    end
    assert_equal 0, @bowling.get_score
  end

  

end
