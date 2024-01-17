module Mutations
  class FindCommunity < GrapQL::Schema::Mutation
    argument :zip_code, String, required: true

    field

    def resolve(zip_code:)
      data = LocationFacade.new(zip_code: zip_code).process_location_search
      render json: ZipCodeSerializer.new(data)
    end
  end
end