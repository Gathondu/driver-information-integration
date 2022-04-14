require 'test_helper'
require 'faraday'

module DriverInformation
  class RequestorTest < ActiveSupport::TestCase
    test "Service returns data" do
      payload = {
        "data": {
          "attributes": {
            "first_name": "Jane",
            "last_name": "Doe",
            "drivers_license_number": "00002052"
          }
        }
      }
      conn = Faraday.new do |builder|
        builder.adapter :test do |stub|
          stub.post(ENV['api_url'], payload.to_json, "Authorization" => "Bearer #{ENV['auth_token']}") do |env|
            [ 201, { 'Content-Type': 'application/json' },
              '{"data":{"id":"cf5ed317235bed5a927f020b75ce8294","type":"DriverInformation","attributes":{"first_name":"Jane","last_name":"Doe","drivers_license_number":"00002052","number_of_incidents":"2","number_of_vehicles":"5"}}}']
          end
        end
      end
      response = conn.post(ENV['api_url'], payload.to_json, "Authorization" => "Bearer #{ENV['auth_token']}")
      body = JSON.parse(response.body)

      assert_equal 201, response.status
    end
  end
end
