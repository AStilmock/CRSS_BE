module Types
  class FindCommunityInput < GraphQL::Schema::InputObject
    argument :zipCode, Integer, required: true
  end
end