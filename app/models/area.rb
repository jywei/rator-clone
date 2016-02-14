class Area < ActiveRecord::Base
  has_many :companies, :dependent => :restrict_with_error
  validates_presence_of :name

  def company_filter_by_area(career_in)
    if career_in
      self.companies.joins(:jobs).where("jobs.status = ? AND companies.published_on <= ?",  "career_begin", Time.now).uniq.size
    else
      self.companies.where("companies.published_on <= ?", Time.now).uniq.size
    end
  end
end