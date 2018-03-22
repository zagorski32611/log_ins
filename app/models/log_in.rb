class LogIn < ApplicationRecord
    belongs_to :user, class_name: 'User', foreign_key: 'user_id'
    attr_accessor :current_user
    validates :user_id,  presence: true

end
