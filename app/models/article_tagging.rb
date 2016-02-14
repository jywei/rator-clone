class ArticleTagging < ActiveRecord::Base
  belongs_to :article
  belongs_to :article_tag, :counter_cache => :articles_count
end
