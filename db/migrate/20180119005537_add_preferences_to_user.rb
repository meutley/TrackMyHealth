class AddPreferencesToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :weight_unit, :string
    add_column :users, :blood_glucose_unit, :string
  end
end
