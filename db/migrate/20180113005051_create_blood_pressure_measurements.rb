class CreateBloodPressureMeasurements < ActiveRecord::Migration[5.1]
  def change
    create_table :blood_pressure_measurements do |t|
      t.integer :systolic
      t.integer :diastolic
      t.integer :pulse
      t.text :notes
      t.integer :blood_pressure_measurement_position_id
      t.integer :blood_pressure_measurement_location_id

      t.timestamps
    end
  end
end
