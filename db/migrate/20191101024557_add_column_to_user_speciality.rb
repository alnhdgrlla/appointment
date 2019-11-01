class AddColumnToUserSpeciality < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :speciality, :string, default: nil
  end
end
