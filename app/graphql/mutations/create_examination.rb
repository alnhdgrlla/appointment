module Mutations
  class CreateExamination < BaseMutation

    argument :name, String, required: true
    argument :start_time, Types::DateTimeType, required: true
    argument :end_time, Types::DateTimeType, required: true

    type Types::ExaminationType

    def resolve(name: nil, start_time: nil, end_time: nil)
      Examination.create!(
        name: name,
        start_time: start_time,
        end_time: end_time,
        user: context[:current_user],
        status: "pending"
      )
    end
  end
end