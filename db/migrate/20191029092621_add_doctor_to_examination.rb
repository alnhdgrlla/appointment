class AddDoctorToExamination < ActiveRecord::Migration[6.0]
  def change
    add_column :examinations, :doctor, :string
  end
end
