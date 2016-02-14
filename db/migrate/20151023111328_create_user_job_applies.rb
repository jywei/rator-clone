class CreateUserJobApplies < ActiveRecord::Migration
  def change
    create_table :user_job_applies do |t|
      t.integer :user_id, index: true
      t.integer :job_id, index: true
      t.string  :token, :unique => true, :index => true
      t.datetime :sent_at
      t.timestamps null: false
    end
  end
end
