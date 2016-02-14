class JobCategory < ActiveRecord::Base
  has_many :jobs, :dependent => :restrict_with_error
  validates_presence_of :name

  def job_filter_by_intern(intern)
    if intern
      self.jobs.where("status = ? AND intern = ? AND published_on <= ?", "career_begin", true, Time.now).size
    else
      self.jobs.where("status = ? AND published_on <= ?", "career_begin", Time.now).size
    end
  end
end
