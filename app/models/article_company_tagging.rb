class ArticleCompanyTagging < ActiveRecord::Base
  belongs_to :article
  belongs_to :company_tag
end
