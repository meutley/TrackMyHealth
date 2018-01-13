class CreateBloodPressureMeasurements < ActiveRecord::Migration[5.1]
  def change
    create_table :blood_pressure_measurements do |t|
      t.integer :systolic
      t.integer :diastolic
      t.integer :pulse
      t.text :notes
      t.datetime :taken_at

      t.timestamps
    end
  end
end
