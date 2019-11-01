class Types::ExaminationInput < Types::BaseInputObject
  argument :status, String, required: false
  argument :name, String, required: false
  argument :start_time, Types::DateTimeType, required: false
  argument :end_time, Types::DateTimeType, required: false
  argument :doctor_id, ID, required: false
end