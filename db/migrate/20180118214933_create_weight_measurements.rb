class CreateWeightMeasurements < ActiveRecord::Migration[5.1]
  def change
    create_table :weight_measurements do |t|
      t.integer :user_id
      t.decimal :value
      t.text :notes

      t.timestamps
    end
  end
end
