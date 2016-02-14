class JobTag < ActiveRecord::Base
  has_many :job_taggings
  has_many :jobs, :through => :job_taggings

  has_many :article_job_taggings
  has_many :articles, :through => :article_job_taggings

  def tag_job_count
    self.jobs.where("jobs.status = ? AND jobs.published_on <= ?", "career_begin", Time.now).uniq.size
  end
end
