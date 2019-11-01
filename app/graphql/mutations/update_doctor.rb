module Mutations
  class UpdateDoctor < BaseMutation

    argument :id, ID, required: true
    argument :data, Types::DoctorInput, required: true

    type Types::UserType

    def resolve(id:, data:)
      return GraphQL::ExecutionError.new("Forbidden action") if !context[:current_user].admin?
      doctor = User.find_by(id: id)
      if !data[:doctor_id] 
        doctor.update!(data.to_h)
      else 
        return GraphQL::ExecutionError.new("Update did not finish successfuly")
      end
      doctor
    end
  end
end