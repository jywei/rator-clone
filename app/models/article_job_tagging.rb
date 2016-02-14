class ArticleJobTagging < ActiveRecord::Base
  belongs_to :article
  belongs_to :job_tag
end
