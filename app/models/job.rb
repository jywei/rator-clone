class Job < ActiveRecord::Base
  STATUS = ["career_begin", "career_end"]
  validates_inclusion_of :status, :in => STATUS

  validates_presence_of :name, :content, :published_on, :status, :skill
  belongs_to :company
  belongs_to :job_category, :counter_cache => true

  has_many :job_taggings
  has_many :tags, :through => :job_taggings, :source => :job_tag

  has_many :user_job_follows, dependent: :destroy
  has_many :users, :through => :user_job_follows, :source => :user

  has_many :user_job_applies
  has_many :user_applies, :through => :user_job_applies, :source => :user

  def job_tag_list
    self.tags.map{ |t| t.name }.join(",")
  end

  def job_tag_list=(str)
    arr = str.split(",")

    self.tags = arr.map do |t|
      tag = JobTag.find_by_name(t)
      unless tag
        tag = JobTag.create!( :name => t )
      end
        tag
    end

  end
end
