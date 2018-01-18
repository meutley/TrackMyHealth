class DashboardModule < ApplicationRecord
    scope :available_for_user, ->(current_user_id) {
        joins('LEFT JOIN user_active_dashboard_modules ON dashboard_modules.id = user_active_dashboard_modules.dashboard_module_id AND user_active_dashboard_modules.user_id =', current_user_id.to_s)
        .where('user_active_dashboard_modules.id IS NULL')
        }

    scope :active_for_user, ->(current_user_id) {
        includes(:user_active_dashboard_modules)
            .where(user_active_dashboard_modules: {user_id: current_user_id})
                .order('user_active_dashboard_modules.sort_order')
    }
    
    has_many :user_active_dashboard_modules
    has_many :users, through: :user_active_dashboard_modules
end
