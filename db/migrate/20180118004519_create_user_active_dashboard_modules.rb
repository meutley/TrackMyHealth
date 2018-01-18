class CreateUserActiveDashboardModules < ActiveRecord::Migration[5.1]
  def change
    create_table :user_active_dashboard_modules do |t|

      t.timestamps
    end
  end
end
