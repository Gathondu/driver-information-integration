module Licensable
  def check_validity(license_number)
    license_number !~ /\D/ && license_number.length == 8
  end

  module_function :check_validity
end
