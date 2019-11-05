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

# module Mutations
#   class UpdateExamination < BaseMutation

#     argument :id, ID, required: true
#     argument :data, Types::ExaminationInput, required: true

#     type Types::ExaminationType

#     def resolve(id:, data:)
#       return GraphQL::ExecutionError.new("Forbidden action") if !context[:current_user].admin?
#       exam = Examination.find_by(id: id)
#       if !data[:doctor_id] 
#         exam.update!(doctor: context[:current_user])
#       else 
#         exam.update!(doctor: User.find_by(id: data[:doctor_id]))
#       end
#       exam.update!(data.to_h)
#       exam
#     end
#   end
# end

# module Mutations
#   class UpdateExamination < BaseMutation

#     argument :id, ID, required: true
#     argument :data, Types::ExaminationInput, required: true

#     type Types::ExaminationType

#     def resolve(id:, data:)
#       c_user = context[:current_user]
#       exam = Examination.find_by(id: id)
      
#       return GraphQL::ExecutionError.new("Forbidden action") if !c_user.admin? && c_user.id != exam.doctor_id
      
#       if !data[:doctor_id] 
#         exam.update!(doctor: context[:current_user])
#       else 
#         exam.update!(doctor: User.find_by(id: data[:doctor_id]))
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
      c_user = context[:current_user]
      
      return GraphQL::ExecutionError.new("Forbidden action") if !c_user.admin?
      
      exam = Examination.find_by(id: id)
      info = { status: data[:status], start_time: data[:start_time], end_time: data[:end_time], doctor:data[:doctor] }
      info.reject!{|key,value| value == nil}
      info[:doctor] = context[:current_user] if !info[:doctor]
      if c_user.id = exam.doctor_id
        info[:doctor] = User.find_by(id: data[:doctor_id]) if info[:doctor]
      else
        return GraphQL::ExecutionError.new("Forbidden action")
      end
      exam.update!(info)
      exam
    end
  end
end