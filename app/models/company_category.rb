class CompanyCategory < ActiveRecord::Base
  has_many :companies, :dependent => :restrict_with_error
  validates_presence_of :name

  def company_filter_by_category(area, career_in)
    if area && career_in
      self.companies.where(:area=>area).joins(:jobs).where("jobs.status = ? AND companies.published_on <= ?",  "career_begin", Time.now).uniq.size
    elsif area
      self.companies.where(:area=>area).where("companies.published_on <= ?", Time.now).size
    elsif career_in
      self.companies.joins(:jobs).where("jobs.status = ? AND companies.published_on <= ?",  "career_begin", Time.now).uniq.size
    else
      self.companies.where("companies.published_on <= ?", Time.now).size
    end
  end
end
