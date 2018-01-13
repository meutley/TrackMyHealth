class CreateWeightMeasurements < ActiveRecord::Migration[5.1]
  def change
    create_table :weight_measurements do |t|
      t.float :value
      t.text :notes
      t.datetime :taken_at

      t.timestamps
    end
  end
end
