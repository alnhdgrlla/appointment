class AddCreatedByToExaminations < ActiveRecord::Migration[6.0]
  def change
    add_column :examinations, :created_by, :string
  end
end
