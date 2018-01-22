class AddTakenAtToBloodPressureMeasurement < ActiveRecord::Migration[5.1]
  def change
    add_column :blood_pressure_measurements, :taken_at, :datetime
  end
end
