class CreateArticleCompanies < ActiveRecord::Migration
  def change
    create_table :article_companies do |t|
      t.references :article
      t.references :company
      t.timestamps null: false
    end
  end
end
