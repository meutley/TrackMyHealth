class AddSortOrderToUserActiveDashboardModule < ActiveRecord::Migration[5.1]
  def change
    add_column :user_active_dashboard_modules, :sort_order, :integer
  end
end
