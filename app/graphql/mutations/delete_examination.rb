module Mutations
  class DeleteExamination < BaseMutation
    argument :examination_id, ID, required: true

    type Types::ExaminationType

    def resolve(examination_id:)
      return GraphQL::ExecutionError.new("This is not your examination") if !context[:current_user]
      examination  = Examination.find_by(id:examination_id)
      if examination.present?
        examination.destroy
        examination
      else
       return GraphQL::ExecutionError.new("This examination does not exist")
      end
    end
  end
end