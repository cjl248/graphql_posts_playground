module Types
  class QueryType < Types::BaseObject

    # /testField
    # field :testField, String, null: false
    #
    # def testField
    #   return "Hello, Testing!"
    # end

    # /users
    field :users, [Types::UserType], null: false

    def users
      User.all
    end

    # /user
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def user(id: nil)
      User.find(id)
    end

    # /posts
    field :posts, [Types::PostType], null: false

    def posts
      Post.all
    end

  end
end
