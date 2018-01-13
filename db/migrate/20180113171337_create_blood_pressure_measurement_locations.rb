class CreateBloodPressureMeasurementLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :blood_pressure_measurement_locations do |t|
      t.string :name

      t.timestamps
    end
  end
end
