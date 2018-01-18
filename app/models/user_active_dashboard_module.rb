class UserActiveDashboardModule < ApplicationRecord
    has_many :dashboard_modules
    has_many :users
end
