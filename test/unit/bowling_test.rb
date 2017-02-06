require_relative '../test_case'

class BowlingTest < Test::Unit::TestCase

  def setup
    @bowling = Bowling.new
    @bowling.startgame
  end

  def test_all_zeros
    10.times do
      @bowling.shoot 0, 0
    end
    assert_equal 0, @bowling.get_score
  end

  def test_all_ones
    10.times do
      @bowling.shoot 1, 1
    end
    assert_equal 20, @bowling.get_score
  end

  def test_no_spare
    shots = [] << 0 << 0 <<  0 << 0 <<  3 << 4 <<  6 << 2 <<  0 << 0 <<  0 << 0 <<  0 << 0 << 0 << 0 <<  0 << 0 <<  0 << 0
    @bowling.shoot_all shots
    assert_equal 15, @bowling.get_score
  end

  def test_a_spare
    shots = []  << 0 << 0 << 0 << 0 << 3 << 7 << 6 <<2 << 0 << 0 << 0 <<0 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0
    @bowling.shoot_all shots
    assert_equal 24 , @bowling.get_score
  end

  def test_final_spare
    shots = []  << 0 << 0 << 0 << 0 << 0 <<0 << 0 <<0 << 0 <<0 << 0 <<0 << 0 <<0 << 0 << 0 << 0 <<0 << 3 << 7 <<2
    @bowling.shoot_all shots
    assert_equal 12 , @bowling.get_score
  end

  def test_a_strike
    shots = []  << 0 << 0 << 0 << 0 << 10 << 2 << 3 << 4 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0
    @bowling.shoot_all shots
    assert_equal 24 , @bowling.get_score
  end

  def test_final_strike
    shots = []  << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 10 << 7 << 2
    @bowling.shoot_all shots
    assert_equal 19 , @bowling.get_score
  end

end
