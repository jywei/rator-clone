class CreateArticleTaggings < ActiveRecord::Migration
  def change
    create_table :article_taggings do |t|
      t.integer :article_id, index: true
      t.integer :article_tag_id, index: true
      t.timestamps null: false
    end
  end
end
