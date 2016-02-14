class CreateArticleCategories < ActiveRecord::Migration
  def change
    create_table :article_categories do |t|
      t.string :name
      t.integer :articles_count
      t.timestamps null: false
    end
  end
end
