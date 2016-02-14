class JobTagging < ActiveRecord::Base
  belongs_to :job
  belongs_to :job_tag, :counter_cache => :jobs_count
end
