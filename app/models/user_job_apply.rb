class UserJobApply < ActiveRecord::Base

  belongs_to   :user
  belongs_to   :job
  after_create :generate_token

  def notify!
    UserMailer.notify_job_apply(self).deliver_later!
    self.sent_at = Time.now
    self.save
  end

  def generate_token
    self.token = SecureRandom.hex(10)
    self.save
  end

end