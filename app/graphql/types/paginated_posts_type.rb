# frozen_string_literal: true

module Types
  class PaginatedPostsType < Types::BaseObject
    field :posts, [Types::PostType], null: false
    field :total_count, Integer, null: false
    field :total_pages, Integer, null: false
  end
end
