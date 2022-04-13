require 'test_helper'
require 'faraday'
require 'json'

module DriverInformation
  class RequestorTest < ActiveSupport::TestCase
    test "Service returns data" do
      stubs = Faraday::Adapter::Test::Stubs.new(strict_mode: true)
      stubs.post(ENV['api_url']) do [
        200,
        { 'Content-Type': 'application/json' },
        '"{\"data\":{\"id\":\"cf5ed317235bed5a927f020b75ce8294\",\"type\":\"DriverInformation\",\"attributes\":{\"first_name\":\"Jane\",\"last_name\":\"Doe\",\"drivers_license_number\":\"00002052\",\"number_of_incidents\":\"2\",\"number_of_vehicles\":\"5\"}}}"'
      ]
      end
      byebug
    end

    private

    def client(stubs)
      Faraday.new do |builder|
        builder.adapter :test, stubs
      end
    end
  end
end
