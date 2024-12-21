# frozen_string_literal: true

module Types
  class CommentType < Types::BaseObject
    field :id, Integer
    field :title, String
    field :post, Types::PostType
  end
end
