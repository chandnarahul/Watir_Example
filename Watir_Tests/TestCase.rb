require 'test/unit'

class Demo < Test::Unit::TestCase

  def test_IE     
    assert_equal(4, 2+2 )
  end
  
  def performOperations
    assert_equal(4, 2*2 )
  end

end  