class Types::UserType < Types::BaseObject
  field :id, ID, null: false
  field :name, String, null: false
  field :email, String, null: false
  field :password, String, null: false
  field :admin, Boolean, null:true
  field :doctor, String, null:true
end
