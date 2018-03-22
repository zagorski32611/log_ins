class LogIn < ApplicationRecord
    belongs_to :user
    attr_accessor :current_user
    validates :user_id,  presence: true

end
