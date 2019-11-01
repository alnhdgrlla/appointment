module Types
  class ExaminationType < BaseObject
    field :id, ID, null: true
    field :name, ID, null: true
    field :status, String, null: true
    field :start_time, Types::DateTimeType, null: true
    field :end_time, Types::DateTimeType, null: true
    field :posted_by, UserType, null: true, method: :user
    field :doctor, UserType, null: true
    field :created_by, UserType, null: false
  end
end