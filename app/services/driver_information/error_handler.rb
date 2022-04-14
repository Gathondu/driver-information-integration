module DriverInformation
  class ErrorHandler
    class CreationError < StandardError
      def message
        'Could not create driver information. Please check required attributes'
      end
    end

    class RequestError < StandardError
      def message
        'Driver details matching the provided license number not found.'
      end
    end
  end
end
