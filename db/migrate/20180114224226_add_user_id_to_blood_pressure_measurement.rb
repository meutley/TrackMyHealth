class AddUserIdToBloodPressureMeasurement < ActiveRecord::Migration[5.1]
  def change
    add_column :blood_pressure_measurements, :user_id, :integer
    add_index :blood_pressure_measurements, :user_id
  end
end
