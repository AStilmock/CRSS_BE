# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :findCommunity, mutation: Mutations::FindCommunity do
      argument :zipCode, String, required: true
    end
  end
end
