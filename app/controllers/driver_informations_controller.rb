require 'licensable'

class DriverInformationsController < ApplicationController
  def create
    @params = params['driver_information']['data']['attributes']
    first_name = @params['first_name']
    last_name = @params['last_name']
    license_number = @params['drivers_license_number']
    raise 'Invalid drivers license number' unless Licensable.check_validity(license_number)

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
      render jsonapi: @new_record, status: :created
    end

  rescue DriverInformation::ErrorHandler::CreationError => e
    render json: error_response(e.message), status: :unauthorized

  rescue DriverInformation::ErrorHandler::RequestError => e
    render json: error_response(e.message), status: :unauthorized
  end

  def show
    @info = Information.find_by(api_id: params['id'])
    render jsonapi: @info
  end

  private

  def error_response(message)
    {
      errors:
      [
        { message: message }
      ],
      title: 'API Error'
    }
  end
end
