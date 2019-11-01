# module Mutations
#   class CreateExamination < BaseMutation

#     argument :name, String, required: true
#     argument :start_time, Types::DateTimeType, required: true
#     argument :end_time, Types::DateTimeType, required: true

#     type Types::ExaminationType

#     def resolve(name: nil, start_time: nil, end_time: nil)
#       Examination.create!(
#         name: name,
#         start_time: start_time,
#         end_time: end_time,
#         user: context[:current_user],
#         status: "pending"
#       )
#     end
#   end
# end

module Mutations
  class CreateExamination < BaseMutation

    argument :name, String, required: true
    argument :doctor_id, ID, required: true
    argument :start_time, Types::DateTimeType, required: true
    argument :end_time, Types::DateTimeType, required: true

    type Types::ExaminationType

    def resolve(name: nil, doctor_id:, start_time: nil, end_time: nil)
      unless User.find(doctor_id).admin 
        return GraphQL::ExecutionError.new("the id you choose was not doctor's")
      else 
        Examination.create!(
          name: name,
          doctor_id: doctor_id,
          start_time: start_time,
          end_time: end_time,
          user: context[:current_user],
          status: "pending"
          )
      end
    end
  end
end