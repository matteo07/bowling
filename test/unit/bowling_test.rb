require_relative '../test_case'

class BowlingTest < Test::Unit::TestCase

  def setup
    @bowling = Bowling.new
    @bowling.startgame
  end

  def test_all_zeros
    20.times do
      @bowling.single_shoot 0
    end
    assert_equal 0, @bowling.get_score
  end

  def test_all_ones
    20.times do
      @bowling.single_shoot 1
    end
    assert_equal 20, @bowling.get_score
  end

  def test_no_spare
    shots = [] << 0 << 0 <<  0 << 0 <<  3 << 4 <<  6 << 2 <<  0 << 0 <<  0 << 0 <<  0 << 0 <<  0 << 0 <<  0 << 0 <<  0 << 0
    shots.each do |x|
      @bowling.single_shoot x
    end
    assert_equal 15, @bowling.get_score
  end



end
