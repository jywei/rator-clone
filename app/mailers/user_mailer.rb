class UserMailer < ApplicationMailer


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notify_comment.subject
  #
  def notify_job_apply(apply)
    @job = apply.job
    @company = apply.job.company
    @user = apply.user
    @token = apply.token

    mail( to: [@company.email], bcc:["service@yourator.co"], subject: "hi, #{@company.brand}, 『#{@user.name}』在yourator應徵『#{@job.name}』職位!!" )
  end

end

