class CreateBloodGlucoseMeasurements < ActiveRecord::Migration[5.1]
  def change
    create_table :blood_glucose_measurements do |t|
      t.integer :user_id
      t.decimal :value
      t.text :notes
      t.datetime :taken_at
    end
  end
end
