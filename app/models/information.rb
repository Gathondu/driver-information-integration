class Information < ApplicationRecord
  validates :api_id, presence: true
  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :license_number, presence: true
end
