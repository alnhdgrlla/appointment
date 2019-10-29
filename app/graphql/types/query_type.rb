module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    # field :examinations,[Types::ExaminationType], null: false
    field :patient_examinations, resolver: Resolvers::PatientExaminations
    field :patient_info, resolver: Resolvers::PatientInfo
    field :doctor_info, resolver: Resolvers::DoctorInfo
  end
end
