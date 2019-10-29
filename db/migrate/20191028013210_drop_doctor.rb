class DropDoctor < ActiveRecord::Migration[6.0]
  def change
    drop_table :doctors
  end
end
