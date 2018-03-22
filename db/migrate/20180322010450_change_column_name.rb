class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    remove_column :log_ins, :add_foreign_key
  end
end
