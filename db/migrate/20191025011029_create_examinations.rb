class CreateExaminations < ActiveRecord::Migration[6.0]
  def change
    create_table :examinations do |t|
      t.string :doctor_id
      t.string :patient_id

      t.timestamps
    end
  end
end
