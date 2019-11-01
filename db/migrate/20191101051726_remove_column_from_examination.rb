class RemoveColumnFromExamination < ActiveRecord::Migration[6.0]
  def change
    remove_column :examinations, :created_by
  end
end
