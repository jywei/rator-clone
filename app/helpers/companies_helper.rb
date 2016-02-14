module CompaniesHelper
  def follow_status(company)
    if current_user && current_user.is_follow_company?(company)
      "已收藏"
    else
      "立即收藏至您個人檔案裡面"
    end
  end

  def follow_class(company)
    if current_user && current_user.is_follow_company?(company)
      "glyphicon glyphicon-heart"
    else
      "glyphicon glyphicon-heart-empty"
    end
  end

  def is_category_active?(c)
    if params[:category] == c.id.to_s
      "active"
    else
      ""
    end
  end

  def is_area_active?(c)
    if params[:area] == c.id.to_s
      "active"
    else
      ""
    end
  end

  def is_career_in_active?(c)
    if params[:career_in] == c
      "active"
    else
      ""
    end
  end
end