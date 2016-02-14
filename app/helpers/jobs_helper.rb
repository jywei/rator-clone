module JobsHelper
  def follow_job_status(job)
    if current_user && current_user.is_follow_job?(job)
      "已收藏"
    else
      "立即收藏至您個人檔案裡面"
    end
  end

  def follow_job_class(job)
    if current_user && current_user.is_follow_job?(job)
      "glyphicon glyphicon-heart"
    else
      "glyphicon glyphicon-heart-empty"
    end
  end

  def summary_class(user)
    if user.summary.present?
      "panel panel-info"
    else
      "panel panel-danger"
    end
  end

  def experiences_class(user)
    if user.experiences.present?
      "panel panel-info"
    else
      "panel panel-danger"
    end
  end

  def educations_class(user)
    if user.educations.present?
      "panel panel-info"
    else
      "panel panel-danger"
    end
  end

  def skills_class(user)
    if user.skills.present?
      "panel panel-info"
    else
      "panel panel-danger"
    end
  end

  def languages_class(user)
    if user.languages.present?
      "panel panel-info"
    else
      "panel panel-danger"
    end
  end

  def sex_class(user)
    if user.sex.present?
      "panel panel-info"
    else
      "panel panel-danger"
    end
  end

  def phone_class(user)
    if user.phone.present?
      "panel panel-info"
    else
      "panel panel-danger"
    end
  end

  def address_class(user)
    if user.address.present?
      "panel panel-info"
    else
      "panel panel-danger"
    end
  end

  def collections_class(user)
    if user.collections.present?
      "panel panel-info"
    else
      "panel panel-danger"
    end
  end

  def birthday_class(user)
    if user.birthday.present?
      "panel panel-info"
    else
      "panel panel-danger"
    end
  end

  def is_intern_active?(i)
    if params[:intern] == i
      "active"
    else
      ""
    end
  end

end
