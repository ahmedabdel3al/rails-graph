# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    field :id, Integer
    field :title, String
    field :rating, Integer
    field :comments, [Types::CommentType]
  end
end
