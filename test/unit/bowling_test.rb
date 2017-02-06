require_relative '../test_case'

class BowlingTest < Test::Unit::TestCase

  def setup
    @bowling = Bowling.new
    @bowling.startgame
    @shots = []
  end

  def test_all_zeros
    20.times do
      @shots << 0
    end
    check_score(0)
  end

  def test_all_ones
    20.times do
      @shots << 1
    end
    check_score(20)
  end

  def test_no_spare
    @shots << 0 << 0 <<  0 << 0 <<  3 << 4 <<  6 << 2 <<  0 << 0 <<  0 << 0 <<  0 << 0 << 0 << 0 <<  0 << 0 <<  0 << 0
    check_score(15)
  end

  def test_a_spare
    @shots << 0 << 0 << 0 << 0 << 3 << 7 << 6 <<2 << 0 << 0 << 0 <<0 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0
    check_score(24)
  end

  def test_final_spare
    @shots << 0 << 0 << 0 << 0 << 0 <<0 << 0 <<0 << 0 <<0 << 0 <<0 << 0 <<0 << 0 << 0 << 0 <<0 << 3 << 7 <<2
    check_score(12)
  end

  def test_a_strike
    @shots << 0 << 0 << 0 << 0 << 10 << 2 << 3 << 4 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0
    check_score(24)
  end

  def test_final_strike
    @shots << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 0 << 10 << 7 << 2
    check_score(19)
  end

  def test_a_martian_spare
    @shots   << 3 << 3 << 4    << 5 << 0 << 0    << 0 <<0 << 0     << 0 << 0 << 0    << 0 << 0 << 0    << 0 << 0 << 0    << 0 << 0 << 0
    @shots   << 0 << 0 << 0    << 0 << 0 << 0    << 0 << 0 << 0    << 0 << 0 << 0    << 0 << 0 << 0    << 0 << 0 << 0    << 0 << 0 << 0
    check_martian_score(20)
  end

  def test_final_martian_spare
    @shots << 0 << 0 << 0   << 0 << 0 << 0   << 0 << 0 << 0   << 0 << 0 << 0   << 0 << 0 << 0   << 0 << 0 << 0   << 0 << 0 << 0
    @shots << 0 << 0 << 0   << 0 << 0 << 0   << 0 << 0 << 0   << 0 << 0 << 0   << 0 << 0 << 0   << 0 << 0 << 0   << 3 << 3 << 4 << 2
    check_martian_score(12)
  end

  def test_a_martian_strike
    @shots << 10             << 5 << 0       << 0 << 10        << 2 << 0 << 0    << 0 << 0 << 0    << 0 << 0 << 0    << 0 << 0 << 0
    @shots << 0 << 0 << 0    << 0 << 0 << 0  << 0 << 0 << 0    << 0 << 0 << 0    << 0 << 0 << 0    << 0 << 0 << 0    << 0 << 0 << 0
    check_martian_score(34)
  end

  private

  def check_score(score)
    @bowling.shoot_all @shots
    assert_equal score, @bowling.get_score
  end

  def check_martian_score(score)
    @bowling.set_martian
    @bowling.shoot_all @shots
    assert_equal score, @bowling.get_score
  end

end