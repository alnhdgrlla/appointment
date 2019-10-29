class AddClumnToExamination < ActiveRecord::Migration[6.0]
  def change
    add_column :examinations, :status, :string
  end
end
