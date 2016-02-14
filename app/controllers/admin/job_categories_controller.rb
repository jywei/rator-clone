class Admin::JobCategoriesController < ApplicationController

  before_action :authenticate_user!
  before_action :check_admin

  def create
    @job_category = JobCategory.new(job_category_params)
    @job_category.save
    redirect_to admin_company_categories_path
  end

  def destroy
    @job_category = JobCategory.find(params[:id])
    unless @job_category.destroy
      flash.now[:alert] = "有資料不能刪"
    end
    redirect_to admin_company_categories_path
  end

  def update
    @job_category = JobCategory.find(params[:id])
    @job_category.update(job_category_params)
    redirect_to admin_company_categories_path
  end

  private

  def job_category_params
    params.require(:job_category).permit(:name, :position)
  end
end
