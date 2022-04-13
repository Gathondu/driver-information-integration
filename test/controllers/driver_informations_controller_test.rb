require "test_helper"

class DriverInformationsControllerTest < ActionDispatch::IntegrationTest

  def test_can_retrieve_driver_information
    payload = JSON.parse(file_fixture('example_request.json').read)

    post driver_informations_url, params: payload.to_json, headers: { 'Accept' => 'application/vnd.api+json', 'Content-Type' => 'application/json' }
  end

end
