class CreateCompanyForms < ActiveRecord::Migration
  def change
    create_table :company_forms do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :category
      t.text   :content
      t.timestamps null: false
    end
  end
end
