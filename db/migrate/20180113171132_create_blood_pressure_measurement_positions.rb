class CreateBloodPressureMeasurementPositions < ActiveRecord::Migration[5.1]
  def change
    create_table :blood_pressure_measurement_positions do |t|
      t.string :name

      t.timestamps
    end
  end
end
