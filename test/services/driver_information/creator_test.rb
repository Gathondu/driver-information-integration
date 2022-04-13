require 'test_helper'

module DriverInformation
  class CreatorTest < ActiveSupport::TestCase
    test "creates records" do
      info = DriverInformation::Creator.call("cf5ed317235bed5a927f020b75ce8294", "Jane", "Doe", "00002052", "2", "5")

      assert_equal Information.find_by(api_id: 'cf5ed317235bed5a927f020b75ce8294'), info
    end
  end
end
