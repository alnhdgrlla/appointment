module Resolvers
  class DoctorInfo < Resolvers::Base
    argument :speciality, String, required: false

    type [Types::UserType], null: false

    def resolve(speciality:nil)
      doctor = User.where(admin: true)
      doctor = User.where(speciality: speciality)
      return GraphQL::ExecutionError.new("This doctor does not exist") if !doctor
      doctor
    end
  end
end