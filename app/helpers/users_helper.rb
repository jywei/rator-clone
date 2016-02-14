module UsersHelper
  def setup_resume(user)
    user.experiences.build if user.experiences.blank?
    user.educations.build  if user.educations.blank?
    user.collections.build if user.collections.blank?
    user.skills.build      if user.skills.blank?
    user.languages.build   if user.languages.blank?
    user
  end
end
