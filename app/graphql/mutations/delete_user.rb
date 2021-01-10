class Mutations::DeleteUser < Mutations::BaseMutation
  argument :id,  ID, required: true

  field :user,  Types::UserType, null: false
  field :errors, [String], null: false

  def resolve(id:)
    user = User.find(id)
    if user
      user.delete
      {
        user: user,
        errors: []
      }
    else
      {
        user: nil,
        errors: ["failed to find and delete user"]
      }
    end
  end

end
