class DeleteColumnFromExaminations2 < ActiveRecord::Migration[6.0]
  def change
    remove_column :examinations, :doctor_id
    remove_column :examinations, :patient_id
  end
end
