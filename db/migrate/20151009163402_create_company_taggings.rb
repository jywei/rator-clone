class CreateCompanyTaggings < ActiveRecord::Migration
  def change
    create_table :company_taggings do |t|
      t.integer :company_id, index: true
      t.integer :company_tag_id, index: true
      t.timestamps null: false
    end
  end
end
