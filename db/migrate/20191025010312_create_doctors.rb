class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :id
      t.string :name
      t.string :speciality

      t.timestamps
    end
  end
end
