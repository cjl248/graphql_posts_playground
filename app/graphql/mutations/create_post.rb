class Mutations::CreatePost < Mutations::BaseMutation
  argument :user_id, ID,  required: true
  argument :title, String, required: true
  argument :body, String, required: true

  field :post, Types::PostType, null: false
  field :errors, [String], null: false

  def resolve(user_id:, title:, body:)
    user = User.find(user_id)
    post = user.posts.new(title: title, body: body)
    if post.save
      {
        post: post,
        errors: []
      }
    else
      {
        post: nil,
        errors: post.errors.full_messages
      }
    end
  end
end
