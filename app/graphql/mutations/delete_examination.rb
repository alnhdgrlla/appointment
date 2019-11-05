# module Mutations
#   class DeleteExamination < BaseMutation
#     argument :examination_id, ID, required: true

#     type Types::ExaminationType

#     def resolve(examination_id:)
#       examination  = Examination.find_by(id:examination_id)
#       return GraphQL::ExecutionError.new("This is not your examination") if examination.user_id != context[:current_user].id
#       if examination.present?
#         examination.destroy
#         examination
#       else
#        return GraphQL::ExecutionError.new("This examination does not exist")
#       end
#     end
#   end
# end

# module Mutations
#   class DeleteExamination < BaseMutation
#     argument :examination_id, ID, required: true

#     type Types::ExaminationType

#     def resolve(examination_id:)
#       examination  = Examination.find_by(id:examination_id)
#       if examination.present?
#         if context[:current_user].admin?
#           examination.destroy
#         elsif examination.user_id != context[:current_user].id
#           examination.destroy
#         else
#           return GraphQL::ExecutionError.new("This is not your examination")
#         end
#         examination
#       else
#        return GraphQL::ExecutionError.new("This examination does not exist")
#       end
#     end
#   end
# end

module Mutations
  class DeleteExamination < BaseMutation
    argument :examination_id, ID, required: true

    type Types::ExaminationType

    def resolve(examination_id:)
      examination  = Examination.find_by(id: examination_id)
      if examination.present?
        if context[:current_user].id == examination.doctor.id || examination.user_id == context[:current_user].id
          examination.destroy
        else
          return GraphQL::ExecutionError.new("This is not your examination")
        end
        examination
      else
       return GraphQL::ExecutionError.new("This examination does not exist")
      end
    end
  end
end
