module Admin::JobsHelper
  def job_status_options
    Job::STATUS.map{ |s| [ t(s, :scope => "job.status") ,s] }
  end

  def job_status_class(j)
    if j.status=="career_begin"
      "success"
    else
      "danger"
    end
  end
end
