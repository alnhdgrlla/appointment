# module Mutations
#   class UpdateExamination < BaseMutation

#     argument :id, ID, required: true
#     argument :data, Types::ExaminationInput, required: true

#     type Types::ExaminationType

#     def resolve(id:, data:)
#       return GraphQL::ExecutionError.new("Forbidden action") if !context[:current_user].admin?
#       exam = Examination.find_by(id: id)
#       # binding.pry
#       if !data[:doctor_id] 
#         exam.update!(doctor: context[:current_user].id)
#       else 
#         exam.update!(doctor_id: User.find_by(id: data[:doctor_id]))
#       end
#       exam.update!(data.to_h)
      
#       exam
#     end
#   end
# end

module Mutations
  class UpdateExamination < BaseMutation

    argument :id, ID, required: true
    argument :data, Types::ExaminationInput, required: true

    type Types::ExaminationType

    def resolve(id:, data:)
      return GraphQL::ExecutionError.new("Forbidden action") if !context[:current_user].admin?
      exam = Examination.find_by(id: id)
      if !data[:doctor_id] 
        exam.update!(doctor: context[:current_user])
      else 
        exam.update!(doctor: User.find_by(id: data[:doctor_id]))
      end
      exam.update!(data.to_h)
      exam
    end
  end
end