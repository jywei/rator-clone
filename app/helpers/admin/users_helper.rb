module Admin::UsersHelper
  def user_sexs_options
    User::SEXS.map{ |s| [ t(s) ,s] }
  end

  def language_degrees_options
    User::LANGUAGE_DEGREES.map{ |s| [ t(s, :scope => "language.degree"), s] }
  end
end
