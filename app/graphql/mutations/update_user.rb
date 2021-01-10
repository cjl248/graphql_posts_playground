class Mutations::UpdateUser < Mutations::BaseMutation
  argument :id, ID, required: true
  argument :name, String, required: false
  argument :email, String, required: false

  field :user, Types::UserType, null: true
  field :errors, [String], null: true

  def resolve(id:, name:, email:)
    user = User.find(id)
    if user
      user.update(name: name, email: email)
      {
        user: user,
        errors: user.errors
      }
    else
      {
        user: nil,
        errors: ["failed to find user"]
      }
    end
  end
end
