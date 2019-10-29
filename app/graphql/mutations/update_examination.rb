module Mutations
  class UpdateExamination < BaseMutation

    argument :id, ID, required: true
    argument :data, Types::ExaminationInput, required: true

    type Types::ExaminationType

    def resolve(id:, data:)
      return GraphQL::ExecutionError.new("Forbidden action") if !context[:current_user].admin?
      exam = Examination.find_by(id: id)
      exam.update!(data.to_h)
      exam
    end
  end
end

# module Mutations
#   class UpdateExamination < BaseMutation

#     argument :id, ID, required: true
#     argument :doctor, Types::UserType, required: true
#     argument :data, Types::ExaminationInput, required: true

#     type Types::ExaminationType

#     def resolve(id:, doctort: context[:current_user], data:)
#       return GraphQL::ExecutionError.new("Forbidden action") if !context[:current_user].admin?
#       exam = Examination.find_by(id: id)
#       exam.update!(data.to_h)
#       exam
#     end
#   end
# end