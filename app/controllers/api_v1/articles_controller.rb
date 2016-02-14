class ApiV1::ArticlesController < ApiController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

end