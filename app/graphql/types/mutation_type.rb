module Types
  class MutationType < Types::BaseObject
    field :community, Types::CommunityType, null: false do
      argument :zip_code, String, required: true
    end

    def community(zip_code:)
      community = LocationFacade.new(zip_code).process_location_search
    end
  end
end
