# module Resolvers
#   class DoctorInfo < Resolvers::Base
#     # argument :user_id, ID, required: false
#     # argument :email, String, required: false

#     type [Types::UserType], null: false

#     def resolve
#       doctor = User.where(admin: true)
#       doctor
#     end
#   end
# end

module Resolvers
  class DoctorInfo < Resolvers::Base
    argument :speciality, String, required: false

    type [Types::UserType], null: false

    def resolve(speciality:nil)
      doctor = User.where(admin: true)
      doctor = User.where(speciality: speciality)
      doctor
    end
  end
end