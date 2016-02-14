class CompanyTag < ActiveRecord::Base
  has_many :company_taggings
  has_many :companies, :through => :company_taggings, :counter_cache => true

  def tag_company_count
    self.companies.where("companies.published_on <= ?", Time.now).uniq.size
  end
end
