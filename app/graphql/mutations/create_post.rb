# frozen_string_literal: true

module Mutations
  class CreatePost < BaseMutation
    field :post, Types::PostType, null: false

    argument :title, String, required: true

    def resolve(title:)
      post = Post.create!(title: title)

      {
        post: post
      }
    end
  end
end
