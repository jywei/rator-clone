class CreateArticleTags < ActiveRecord::Migration
  def change
    create_table :article_tags do |t|
      t.string  :name
      t.integer :articles_count
      t.timestamps null: false
    end
  end
end
