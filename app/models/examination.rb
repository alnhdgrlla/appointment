class Examination < ApplicationRecord
  belongs_to :user
  belongs_to :doctor, class_name: 'User', foreign_key: "doctor_id"
end
