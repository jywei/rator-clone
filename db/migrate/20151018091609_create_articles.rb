class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string     :title
      t.text       :content
      t.date       :published_on
      t.string     :status
      t.attachment :banner
      t.string     :banner_alt
      t.integer    :article_category_id, index: true
      t.integer    :user_id, index: true
      t.integer    :views_count, default: 0
      t.text       :description
      t.timestamps null: false
    end
  end
end