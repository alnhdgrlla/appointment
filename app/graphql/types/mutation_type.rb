class Types::MutationType < Types::BaseObject
  field :create_user, mutation: Mutations::CreateUser
  field :signin_user, mutation: Mutations::SignInUser
  field :create_examination, mutation: Mutations::CreateExamination
  field :delete_examination, mutation: Mutations::DeleteExamination
  field :update_examination, mutation: Mutations::UpdateExamination
end
