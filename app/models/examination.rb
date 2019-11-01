class Examination < ApplicationRecord
  belongs_to :user
  belongs_to :doctor, class_name: 'User', foreign_key: "doctor_id"
  # has_one :doctor, class_name: 'User', through: :doctor
  # has_one :doctor, class_name: 'User', foreign_key: "doctor"
  # def doctor
  #   User.find(object.doctor.id)
  # end
end
