class AddUserIdToExaminations < ActiveRecord::Migration[6.0]
  def change
    add_reference :examinations, :user, foreign_key: true
  end
end
