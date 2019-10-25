class Patient < ApplicationRecord
  has_many :examinations
  has_many :doctors, through: :examinations
end
