class AddColumnToExaminations4 < ActiveRecord::Migration[6.0]
  def change
    add_column :examinations, :doctor_id, :string
  end
end
