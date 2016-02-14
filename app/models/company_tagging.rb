class CompanyTagging < ActiveRecord::Base
  belongs_to :company
  belongs_to :company_tag, :counter_cache => :companies_count
end
