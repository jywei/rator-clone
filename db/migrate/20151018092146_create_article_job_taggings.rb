class CreateArticleJobTaggings < ActiveRecord::Migration
  def change
    create_table :article_job_taggings do |t|
      t.integer :article_id, index: true
      t.integer :job_tag_id, index: true
      t.timestamps null: false
    end
  end
end
