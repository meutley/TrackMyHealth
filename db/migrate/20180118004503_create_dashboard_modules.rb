class CreateDashboardModules < ActiveRecord::Migration[5.1]
  def change
    create_table :dashboard_modules do |t|
      t.string :name

      t.timestamps
    end
  end
end
