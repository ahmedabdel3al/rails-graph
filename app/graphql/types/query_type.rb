# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :posts, [PostType], null: false,
          description: "List of all posts"

    field :post, PostType, null: true, description: "Find a post by id" do
      argument :id, ID, required: true
    end

    field :paginated_posts, Types::PaginatedPostsType, null: false do
      argument :page, Integer, required: true
      argument :per_page, Integer, required: true
    end

    def paginated_posts(page:, per_page:)
      Post.includes(:comments).offset((page - 1) * per_page).limit(per_page)
      total_count = Post.count

      {
        posts: posts,
        total_count: total_count,
        total_pages: (total_count / per_page.to_f).ceil

      }
    end

    def posts
      Post.includes(:comments).all
    end

    def post(id:)
      Post.includes(:comments).find(id)
    end
  end
end
