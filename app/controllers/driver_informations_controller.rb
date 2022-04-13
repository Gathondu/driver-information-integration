require 'json'
class DriverInformationsController < ApplicationController

  def create
    first_name = params['first_name']
    last_name = params['last_name']
    license_number = params['drivers_license_number']

    @record = Information.find_by(license_number: license_number)
    if @record
      render jsonapi: @record
    else
      @data = DriverInformation::Requestor.call(first_name, last_name, license_number)
      @info = @data['attributes']
      @new_record = DriverInformation::Creator.call(
        @data['id'],
        first_name,
        last_name,
        license_number,
        @info['number_of_incidents'],
        @info['number_of_vehicles']
      )
      render jsonapi: @new_record
    end
  end

  def show
    @info = Information.find_by(api_id: params['id'])
    render jsonapi: @info
  end

end
