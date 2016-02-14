class CreateArticleCompanyTaggings < ActiveRecord::Migration
  def change
    create_table :article_company_taggings do |t|
      t.integer :article_id, index: true
      t.integer :company_tag_id, index: true
      t.timestamps null: false
    end
  end
end
