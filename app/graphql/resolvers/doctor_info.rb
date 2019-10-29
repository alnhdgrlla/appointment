module Resolvers
  class DoctorInfo < Resolvers::Base
    # argument :user_id, ID, required: false
    # argument :email, String, required: false

    type [Types::UserType], null: false

    def resolve
      doctor = User.where(admin: true)
      doctor
    end
  end
end