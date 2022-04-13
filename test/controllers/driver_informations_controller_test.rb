require "test_helper"

class DriverInformationsControllerTest < ActionDispatch::IntegrationTest

  def test_can_retrieve_driver_information
    payload = {
      "data": {
        "attributes": {
          "first_name": "testf1",
          "last_name": "testf2",
          "drivers_license_number": "23456780"
        }
      }
    }.to_json

    post driver_informations_url, params: payload, headers: { 'Accept' => 'application/vnd.api+json', 'Content-Type' => 'application/json' }

    assert_response :success
  end

  def test_will_create_information_record_if_not_persisted
    payload = JSON.parse(file_fixture('example_request.json').read)

    post driver_informations_url, params: payload.to_json, headers: { 'Accept' => 'application/vnd.api+json', 'Content-Type' => 'application/json' }

    assert_response :created
  end

  def test_record_is_retrieved_correctly
    get '/driver_informations/testuuid2'

    assert_response :success
  end

end
