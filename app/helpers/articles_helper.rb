module ArticlesHelper
  def follow_article_status(article)
    if current_user && current_user.is_follow_article?(article)
      "已收藏"
    else
      "立即收藏至您個人檔案裡面"
    end
  end

  def follow_article_class(article)
    if current_user && current_user.is_follow_article?(article)
      "glyphicon glyphicon-heart"
    else
      "glyphicon glyphicon-heart-empty"
    end
  end
end
