class Admin::JobsController < ApplicationController

  before_action :authenticate_user!
  before_action :check_admin
  before_action :find_company, except: [:all_job]
  before_action :find_jobs, only: [:show, :edit, :update, :destroy]


  def index
  end

  def show
  end

  def new
    @job = @company.jobs.new
  end

  def create
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:notice] = "Create Success"
     redirect_to admin_company_job_path(@company,@job)
    else
      flash.now[:alert] = "Create Failure"
      render "new"
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      flash[:notice] = "Update Success"
      redirect_to admin_company_job_path(@company,@job)
    else
      flash.now[:alert] = "Update Failure"
      render "edit"
    end
  end

  def destroy
    @job.destroy
    redirect_to admin_company_jobs_path(@company)
  end

  def all_job
    @jobs = Job.all
    @tags = JobTag.all
    @categories = JobCategory.all

    if params[:published]
      @jobs = @jobs.order("published_on DESC")
    end

    if params[:tag]
      @tag = JobTag.find(params[:tag])
      @jobs = @tag.jobs
    end

    if params[:status]
      @jobs = @jobs.where(status: params[:status])
    end

    @jobs = @jobs.order("id DESC").includes(:tags, :job_category, :company)
  end

  protected

  def find_company
    @company = Company.find_by_en_name(params[:company_id])
    @jobs = @company.jobs
  end

  def find_jobs
    @job = @company.jobs.find(params[:id])
  end

  def job_params
   params.require(:job).permit(:name, :content, :skill, :published_on, :status, :job_tag_list, :job_category_id, :salary_ceiling, :salary_floor, :year_salary_ceiling, :year_salary_floor, :intern)
  end

end
