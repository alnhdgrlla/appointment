class Types::DoctorInput < Types::BaseInputObject
  argument :name, String, required: false
  argument :email, String, required: false
  argument :password, String, required: false
  argument :speciality, String, required: false
end