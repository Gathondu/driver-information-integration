module DriverInformation
  class Creator < ApplicationService
    attr_accessor :api_id, :first_name, :last_name, :license_number, :incidents, :vehicles

    def initialize(api_id, first_name, last_name, license_number, incidents, vehicles)
      @api_id = api_id
      @first_name = first_name
      @last_name = last_name
      @license_number = license_number
      @incidents = incidents
      @vehicles = vehicles
    end

    def call
      info = Information.new do |info|
        info.api_id = @api_id
        info.first_name = @first_name
        info.last_name = @last_name
        info.license_number = @license_number
        info.incidents = @incidents
        info.vehicles = @vehicles
      end

      raise 'Error saving information' unless info.save!
      info
    end
  end
end
