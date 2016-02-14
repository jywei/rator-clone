class CompaniesController < ApplicationController
  def index
    @companies = Company.all
    @tags = CompanyTag.joins(:companies).where("companies.published_on <= ?", Time.now).uniq
    @categories = CompanyCategory.all.order("position ASC").includes(:companies)
    @areas = Area.all.order("position ASC").includes(:companies)

    if params[:area]
      @area = Area.find(params[:area])
      @companies = @companies.where(:area=> @area)
    end

    if params[:category]
      @category = CompanyCategory.find(params[:category])
      @companies = @companies.where(:company_category=> @category)
    end

    if params[:tag]
      @tag = CompanyTag.find(params[:tag])
      @companies = @tag.companies
    end

    if params[:career_in]
      @companies = @companies.joins(:jobs).where("jobs.status = ?",  "career_begin").uniq
    end

    @companies = @companies.where("companies.published_on <= ?", Time.now).order("published_on DESC").includes(:tags, :banners, :company_category).page(params[:page]).per(30)
    @page_title = "優質企業人才招募中"
    @page_desc = "Yourator職涯情報透過篩選合作企業的方式，讓真正優質的公司與團隊能夠更容易被求職者看見。Yourator積極與新創公司、電商、文創、社會企業等極具發展性的企業合作，希望幫助好公司找到好人才、也幫好人才找到適合自己的火箭船！"
    @page_keywords = "新創公司, 徵才, 找工作, 求職, 公司簡介, 招募"
  end

  def show
    @company = Company.find_by_en_name(params[:id])
    # cookies紀錄
    @jobs = @company.jobs.where(status:"career_begin")

    unless cookies["view-company-#{@company.id}"]
      @company.increment!(:views_count)
      cookies["view-company-#{@company.id}"] = true
    end

    @hash = Gmaps4rails.build_markers(@company) do |company, marker|
      marker.lat company.latitude
      marker.lng company.longitude
    end

    @page_title = @company.brand  + " - " + "優質企業人才招募中"
    @page_desc = "Yourator職涯情報透過篩選合作企業的方式，讓真正優質的公司與團隊能夠更容易被求職者看見。Yourator積極與新創公司、電商、文創、社會企業等極具發展性的企業合作，希望幫助好公司找到好人才、也幫好人才找到適合自己的火箭船！"
    @page_keywords = "新創公司, 徵才, 找工作, 求職, 公司簡介, 招募"
  end

  def home
    @home_companies = Company.limit(6).order("sequence DESC").includes(:tags, :banners)
    @home_articles = Article.limit(4).order("published_on DESC").includes(:article_category, :article_tags)
    @advert = Advert.all.includes(:advert_banners)
  end

  def about
  end

  def privacy
  end

  def follow
    @company = Company.find_by_en_name(params[:id])

    if current_user.is_follow_company?(@company)
      UserCompanyFollow.find_by(:company=>@company, :user=>current_user).destroy
    else
      UserCompanyFollow.create(:company=>@company, :user=>current_user)
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
end
