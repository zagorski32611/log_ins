class CreateLogIns < ActiveRecord::Migration[5.1]
  def change
    create_table :log_ins do |t|
      t.string :website
      t.string :username
      t.string :password
      t.string :security_question
      t.string :security_answer
      t.timestamps
    end
    add_foreign_key :log_ins, :user_id
  end
end
