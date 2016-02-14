class Admin::ArticleCategoriesController < ApplicationController

  before_action :authenticate_user!
  before_action :check_admin

  def create
    @article_category = ArticleCategory.new(article_category_params)
    @article_category.save
    redirect_to admin_company_categories_path
  end

  def destroy
    @article_category = ArticleCategory.find(params[:id])
    unless  @article_category.destroy
      flash.now[:alert] = "有資料不能刪"
    end
    redirect_to admin_company_categories_path
  end

  def update
    @article_category = ArticleCategory.find(params[:id])
    @article_category.update(article_category_params)
    redirect_to admin_company_categories_path
  end

  private

  def article_category_params
    params.require(:article_category).permit(:name, :position)
  end
end
