class ChangeColumnOfExaminations < ActiveRecord::Migration[6.0]
  def change
    remove_column :examinations, :doctor
  end
end
