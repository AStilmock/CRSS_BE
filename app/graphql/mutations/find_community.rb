module Mutations
  class FindCommunity < BaseMutation
    null true
    argument :input, Types::FindCommunityInput, required: true

    field :formatted_address, String, null: true
    field :errors, [String], null: false

    def resolve(input:)
      location_facade = LocationFacade.new(input)
      result = location_facade.find_community

      {
        formatted_address: result[:formatted_address],
        errors: result[:errors]
      }
    end
  end
end