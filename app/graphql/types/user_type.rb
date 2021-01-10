module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :email, String, null: true
    field :posts, [Types::PostType], null: true
    # field :created_at, GraphQL::Types::ISO8601DateTime, required: true
    # field :updated_at, GraphQL::Types::ISO8601DateTime, required: true

    field :postsCount, Integer, null: true

    def postsCount
      object.posts.size
    end
  end
end
