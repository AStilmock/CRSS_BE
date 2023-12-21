module Types
  class FindCommunityInput < GraphQL::Schema::InputObject
    argument :zipCode, String, required: true
  end
end