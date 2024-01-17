module Types
  class MutationType < Types::BaseObject
    # field :findCommunity, mutation: Mutations::FindCommunity do
    #   argument :zipCode, GraphQL::Types::String, required: true
    # end

    field :findCommunity, Types::CommunityType, null: false do
      argument :zip_code, String, required: true
    end

    def find_community(zip_code:)
      require 'pry'; binding.pry
      community = LocationFacade.new(zip_code).process_location_search
    end
  end
end
