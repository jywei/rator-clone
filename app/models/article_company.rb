class ArticleCompany < ActiveRecord::Base
  belongs_to :article
  belongs_to :company
end
