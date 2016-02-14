class JobsController < ApplicationController
  def index
    @jobs = Job.all
    @job_tags = JobTag.joins(:jobs).where("jobs.status = ? AND jobs.published_on <= ?", "career_begin", Time.now).uniq
    @job_categories = JobCategory.all.order("position ASC").includes(:jobs)

    if params[:category]
      @category = JobCategory.find(params[:category])
      @jobs = @category.jobs
    end

    if params[:tag]
      @tag = JobTag.find(params[:tag])
      @jobs = @tag.jobs
    end

    if params[:intern]
      @jobs = @jobs.where("intern = ?", true)
    end

    #關鍵字
    if params[:keyword]
      @jobs = @jobs.where( [ "name like ? or content like ? or skill like ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%" ] )
    end

    @jobs = @jobs.where("status = ? AND published_on <= ?", "career_begin", Time.now).order("published_on DESC").includes(:company, :tags, :company=>:banners).page(params[:page]).per(20)
    @page_title = "找到讓你熱血沸騰的好工作"
    @page_desc = "Yourator職涯情報刊登新創公司、電商、文創、社會企業的潛力職缺，幫助求職者找到最有興趣、最有發展的工作。讓你不在枯燥的低薪工作裡虛耗青春，快上Yourator找到你夢寐以求、可以改變世界的熱血工作。"
    @page_keywords = "工作, 轉職, 新創, 電商, 職缺, 就業"
  end

  def show
    @job = Job.find(params[:id])
    @other_jobs = @job.company.jobs.where(:status=>"career_begin")
    @company = @job.company
    # cookies紀錄
    unless cookies["view-job-#{@job.id}"]
      @job.increment!(:views_count)
      cookies["view-job-#{@job.id}"] = true
    end

    @hash = Gmaps4rails.build_markers(@company) do |company, marker|
      marker.lat company.latitude
      marker.lng company.longitude
    end

    @page_title = @job.name + " - " + @company.brand + " 找到讓你熱血沸騰的好工作"
    @page_desc = "Yourator職涯情報刊登新創公司、電商、文創、社會企業的潛力職缺，幫助求職者找到最有興趣、最有發展的工作。讓你不在枯燥的低薪工作裡虛耗青春，快上Yourator找到你夢寐以求、可以改變世界的熱血工作。"
    @page_keywords = "工作, 轉職, 新創, 電商, 職缺, 就業"
  end

  def follow
    @job = Job.find(params[:id])
    if current_user.is_follow_job?(@job)
      UserJobFollow.find_by(:job=>@job, :user=>current_user).destroy
    else
      UserJobFollow.create(:job=>@job, :user=>current_user)
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  def check_resume
    @user = current_user
    @job = Job.find(params[:id])
    @company = Company.find_by_en_name(params[:company_id])
  end

  def apply
    @job = Job.find(params[:id])

    apply = UserJobApply.create!(:user=>current_user, :job=>@job)
    apply.notify!

    redirect_to success_path
  end

  def success
  end

end
