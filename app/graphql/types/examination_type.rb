module Types
  class ExaminationType < BaseObject
    field :id, ID, null: false
    field :name, ID, null: false
    field :status, String, null: true
    field :start_time, Types::DateTimeType, null: false
    field :end_time, Types::DateTimeType, null: false
    field :posted_by, UserType, null: true, method: :user
    field :accepted_by, UserType, null: true, method: :user
  end
end