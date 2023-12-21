module Mutations
  class FindCommunity < BaseMutation
    null true
    argument :input, Types::FindCommunityInput, required: true

    field :formatted_address, String, null: true
    field :errors, [String], null: false

    # require 'pry'; binding.pry
    def resolve(input:)
      begin
        location_facade = LocationFacade.new(input)
        communities = location_facade.process_location_search
        # what is process_location_search returning?
        {
          formatted_address: communities.map(&:formatted_address).join(', '),
          errors: ["You have reached the end of the internet."] 
        }
      rescue=> e
        {
          formatted_address: nil,
          errors: [e.message]
        }
      end
    end
  end
end