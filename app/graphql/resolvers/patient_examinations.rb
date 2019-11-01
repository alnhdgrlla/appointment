# module Resolvers
#   class Examinations < Resolvers::Base
#     argument :user_id, ID, required: false

#     type [Types::ExaminationType], null: false

#     def resolve(user_id:)
#       c_user = context[:current_user]
#       Examination.where(user_id: c_user.id)
#     end
#   end
# end

module Resolvers
  class PatientExaminations < Resolvers::Base

    argument :status, String, required: false, default_value: nil
    
    type [Types::ExaminationType], null: true

    def resolve(status:)
      c_user = context[:current_user]
      examination = Examination.all
      examination = Examination.where(user_id: c_user.id) if !c_user.admin
      examination = Examination.where(status: status) if status
      
      examination
    end
  end
end