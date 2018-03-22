class AddUserIdToLogIn < ActiveRecord::Migration[5.1]
  def change
    add_column :log_ins, :user_id, :integer
  end
end
