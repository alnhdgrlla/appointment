class AddColumnToPatient < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :name, :string
  end
end
