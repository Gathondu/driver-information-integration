require 'json'

module DriverInformation
  class Requestor < ApplicationService
    attr_accessor :first_name, :last_name, :license_number

    def initialize(first_name, last_name, license_number)
      @first_name = first_name
      @last_name = last_name
      @license_number = license_number
    end

    def call
      response = conn.post do |req|
        req.headers['Content-Type'] = 'application/json'
        req.body = body
      end
      raise 'Driver details not found' unless response.status == 200
      JSON.parse(response.body)
    end


    private

    def conn
      Faraday.new(
        url: ENV['api_url']
      ) do |req|
        req.request :authorization, 'Bearer', ENV['auth_token']
      end
    end

    def body
      {
        "data": {
          "attributes": {
            "first_name": @first_name,
            "last_name": @last_name,
            "drivers_license_number": @license_number
          }
        }
      }.to_json
    end
  end
end
