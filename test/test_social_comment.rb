require File.dirname(__FILE__) + '/test_helper.rb'

class TestSocialComment < Test::Unit::TestCase

  def setup
    @tester = Social::CommentClient.new("http://admin:admin@localhost:8080/social-rest", "cm-intra-content-4977296")
  end
  
  def test_create_rand
    @tester.create_rand do |c|
      assert_equal(c[:state], "unedited")
    end
  end
  
end
