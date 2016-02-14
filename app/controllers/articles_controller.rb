class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @categories = ArticleCategory.order("position ASC").all.includes(:articles)
    @tags = ArticleTag.all.includes(:articles)
    @new_articles = Article.limit(10).order("published_on DESC")

    if params[:category]
      @category = ArticleCategory.find(params[:category])
      @articles = @category.articles
    end

    if params[:tag]
      @tag = ArticleTag.find(params[:tag])
      @articles = @tag.articles
    end

    @articles = @articles.order("published_on DESC").where(status:"published").page(params[:page]).per(20)
    @articles = @articles.includes(:companies, :article_tags, :user, :article_category)
    @page_title = "讀職涯專欄、持續提升職場價值"
    @page_desc = "Yourator職涯情報持續分享職涯專欄，幫助你吸收職場新知，為下一份好工作做好準備！找工作決不是幾個禮拜的短期任務，只有長期耕耘與自我投資才能在機會來臨時一把抓住! Yourator帶給你最新產業動態、職涯規劃建議分享、面試與履歷撰寫小撇步等，讓你在人生的道路上不迷路! 持續關注Yourator職場專欄，讓你成為最聰明的工作者。"
    @page_keywords = "職涯, 規劃, 職場, 求職, 專欄, 就業情報"
  end

  def show
    @article = Article.find(params[:id])
    @article_company = @article.companies
    @articles_related = @article.article_category.articles.limit(4)

    @categories = ArticleCategory.all
    @tags = ArticleTag.all
    @new_articles = Article.limit(10)


    # cookies紀錄
    unless cookies["view-article-#{@article.id}"]
      @article.increment!(:views_count)
      cookies["view-article-#{@article.id}"] = true
    end

    @page_title = @article.title + " - " + "讀職涯專欄、持續提升職場價值"
    @page_desc = "Yourator職涯情報持續分享職涯專欄，幫助你吸收職場新知，為下一份好工作做好準備！找工作決不是幾個禮拜的短期任務，只有長期耕耘與自我投資才能在機會來臨時一把抓住! Yourator帶給你最新產業動態、職涯規劃建議分享、面試與履歷撰寫小撇步等，讓你在人生的道路上不迷路! 持續關注Yourator職場專欄，讓你成為最聰明的工作者。"
    @page_keywords = "職涯, 規劃, 職場, 求職, 專欄, 就業情報"
  end

  def follow
    @article = Article.find(params[:id])

    if current_user.is_follow_article?(@article)
      UserArticleFollow.find_by(:article=>@article, :user=>current_user).destroy
    else
      UserArticleFollow.create(:article=>@article, :user=>current_user)
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
end
