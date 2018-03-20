class LogIn < ApplicationRecord
    attr_accessor :current_user
    belongs_to :user, optional: true
end
