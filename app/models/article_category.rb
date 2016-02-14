class ArticleCategory < ActiveRecord::Base
  has_many :articles, :dependent => :restrict_with_error
  validates_presence_of :name
end
