class CreateUserCompanyFollows < ActiveRecord::Migration
  def change
    create_table :user_company_follows do |t|
      t.integer :user_id, index: true
      t.integer :company_id, index: true
      t.timestamps null: false
    end
  end
end
