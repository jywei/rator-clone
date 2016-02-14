module Admin::ArticlesHelper
  def article_status_options
     Article::STATUS.map{ |s| [ t(s, :scope => "article.status") ,s] }
  end

   def article_status_class(a)
    if a.status=="published"
      "success"
    else
      "danger"
    end
  end
end