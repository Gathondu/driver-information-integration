class SerializableInformation < JSONAPI::Serializable::Resource
  type 'information'
  attribute :first_name
  attribute :last_name
  attribute :license_number
end
