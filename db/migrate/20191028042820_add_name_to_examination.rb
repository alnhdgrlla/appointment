class AddNameToExamination < ActiveRecord::Migration[6.0]
  def change
    add_column :examinations, :name, :string
  end
end
