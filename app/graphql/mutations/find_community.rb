module Mutations
  class FindCommunity < GrapQL::Schema::Mutation
    null false
    argument :zip_code, String, required: true

    def resolve(zip_code:)
      data = LocationFacade.new(zip_code: zip_code)
      community = data.process_location_search
      require 'pry'; binding.pry
    end
  end
end