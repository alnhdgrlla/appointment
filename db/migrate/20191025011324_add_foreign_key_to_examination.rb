class AddForeignKeyToExamination < ActiveRecord::Migration[6.0]
  def change
    add_reference :doctors, :examination, foreign_key: true
    add_reference :patients, :examination, foreign_key: true
  end
end
