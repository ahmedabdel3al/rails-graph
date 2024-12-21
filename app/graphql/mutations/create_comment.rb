# frozen_string_literal: true

module Mutations
  class CreateComment < BaseMutation
    # TODO: define return fields
    field :comment, Types::CommentType, null: false

    # TODO: define arguments
    argument :title, String, required: true
    argument :postId, Integer, required: true

    # TODO: define resolve method
    def resolve(postId:, title:)
      comment = Comment.create!(title: title, post_id: postId)
      {
        comment: comment
      }
    end
  end
end
