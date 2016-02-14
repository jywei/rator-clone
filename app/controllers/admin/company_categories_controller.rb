class Admin::CompanyCategoriesController < ApplicationController

  before_action :authenticate_user!
  before_action :check_admin

  def index
    @categories = CompanyCategory.all
    @job_categories = JobCategory.all
    @areas = Area.all
    @article_categories = ArticleCategory.all

    if params[:area_edit]
      @area = Area.find(params[:area_edit])
    else
      @area = Area.new
    end

    if params[:category_edit]
      @category = CompanyCategory.find(params[:category_edit])
    else
      @category = CompanyCategory.new
    end

    if params[:job_category_edit]
      @job_category = JobCategory.find(params[:job_category_edit])
    else
      @job_category = JobCategory.new
    end

    if params[:article_category_edit]
      @article_category = ArticleCategory.find(params[:article_category_edit])
    else
      @article_category = ArticleCategory.new
    end
  end

  def create
    @category = CompanyCategory.new(category_params)
    @category.save
    redirect_to admin_company_categories_path
  end

  def update
    @category = CompanyCategory.find(params[:id])
    @category.update(category_params)
    redirect_to admin_company_categories_path
  end

  def destroy
    @category = CompanyCategory.find(params[:id])
    unless @category.destroy
      flash.now[:alert] = "有資料不能刪"
    end
    redirect_to admin_company_categories_path
  end

  private

  def category_params
    params.require(:company_category).permit(:name, :position)
  end

end
