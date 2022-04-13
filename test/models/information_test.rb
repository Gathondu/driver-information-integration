require "test_helper"

class InformationTest < ActiveSupport::TestCase
  # validations
  test "Creating records runs validations" do
    info = Information.new do |info|
      info.api_id = 'test_uuid'
      info.last_name = 'last_name'
      info.license_number = 'license_number'
    end

    refute info.valid?
  end
end
