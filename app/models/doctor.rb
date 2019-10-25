class Doctor < ApplicationRecord
  has_many :examinations, dependent: :destroy
  has_many :patients, through: :examinations
end
