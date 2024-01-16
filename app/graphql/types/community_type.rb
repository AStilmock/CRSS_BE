# frozen_string_literal: true

module Types
  class CommunityType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :county, String
    field :state, String
    field :zip_code, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
