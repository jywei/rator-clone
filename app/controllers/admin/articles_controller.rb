class Admin::ArticlesController < ApplicationController

  before_action :authenticate_user!
  before_action :check_admin
  before_action :find_articles, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
    @categories = ArticleCategory.all
    @tags = ArticleTag.all

    if params[:tag]
      @tag = ArticleTag.find(params[:tag])
      @articles = @tag.articles
    end

    if params[:category]
      @category = ArticleCategory.find(params[:category])
      @articles = @category.articles
    end

    if params[:keyword]
      @articles = @articles.where( [ "title like ?", "%#{params[:keyword]}%" ] )
    end

    if params[:status]
      @articles = @articles.where(status: params[:status])
    end

    @articles = @articles.order("id DESC").includes(:article_category)

  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      flash[:notice] = "Create Success"
      redirect_to admin_articles_path
    else
      flash.now[:alert] = "Create Failure"
      render "new"
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Update Success"
      redirect_to admin_article_path(@article)
    else
      flash.now[:alert] = "Update Failure"
      render "edit"
    end
  end

  def destroy
    @article.destroy
    redirect_to admin_articles_path
  end

  private

  def find_articles
    @article = Article.find(params[:id])
  end

  def article_params
   params.require(:article).permit(:title, :content, :published_on, :description,:status, :banner_alt, :banner, :article_category_id, :article_tag_list, :company_list => [])
  end

end
