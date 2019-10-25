class AddColumnToExamination < ActiveRecord::Migration[6.0]
  def change
    add_column :examinations, :date, :datetime
  end
end
