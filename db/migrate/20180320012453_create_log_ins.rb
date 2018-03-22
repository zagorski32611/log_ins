class CreateLogIns < ActiveRecord::Migration[5.1]
  def change
    create_table :log_ins do |t|
      t.string :website
      t.string :username
      t.string :password
      t.string :security_question
      t.string :security_answer
      t.timestamps
      t.references :users
    end
  end
end
