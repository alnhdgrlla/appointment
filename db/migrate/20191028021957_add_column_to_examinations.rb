class AddColumnToExaminations < ActiveRecord::Migration[6.0]
  def change
    add_column :examinations, :start_time, :datetime
    add_column :examinations, :end_time, :datetime
  end
end
