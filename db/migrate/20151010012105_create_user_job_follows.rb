class CreateUserJobFollows < ActiveRecord::Migration
  def change
    create_table :user_job_follows do |t|
      t.integer :user_id, index: true
      t.integer :job_id, index: true
      t.timestamps null: false
    end
  end
end
