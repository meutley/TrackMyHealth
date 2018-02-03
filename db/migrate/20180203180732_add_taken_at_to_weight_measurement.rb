class AddTakenAtToWeightMeasurement < ActiveRecord::Migration[5.1]
  def change
    add_column :weight_measurements, :taken_at, :datetime
  end
end
