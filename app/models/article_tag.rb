class ArticleTag < ActiveRecord::Base
  has_many :article_taggings
  has_many :articles, :through => :article_taggings
end
