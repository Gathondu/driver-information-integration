require 'test_helper'
require 'licensable'

class LicensableTest < ActiveSupport::TestCase

  test "check_validity" do
    @all_nums = '12345678'
    @short_nums = '1234678'
    @long_nums = '1234567894'
    @with_char = '1234567t'

    assert Licensable.check_validity(@all_nums)
    assert_not Licensable.check_validity(@short_nums)
    assert_not Licensable.check_validity(@long_nums)
    assert_not Licensable.check_validity(@with_char)
  end
end
