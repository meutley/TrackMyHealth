class AddColumnsToUserActiveDashboardModule < ActiveRecord::Migration[5.1]
  def change
    add_column :user_active_dashboard_modules, :dashboard_module_id, :integer
    add_column :user_active_dashboard_modules, :user_id, :integer
  end
end
