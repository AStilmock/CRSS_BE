class ZipCodeSerializer
  include JSONAPI::Serializer
  attributes :name, :county, :state, :zip_code
end