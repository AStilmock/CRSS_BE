# frozen_string_literal: true

module Types
  class FindCommunityType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :county, String, null: false
    field :state, String, null: false
    field :zip_code, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
