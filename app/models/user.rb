class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_create :generate_authentication_token
  validates_presence_of :name, :email
  SEXS = ["male", "female"]
  LANGUAGE_DEGREES = ["Little", "moderate", "proficiency", "native"]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]

  has_attached_file :resume, url: '/system/:class/:attachment/:id_partition/:style/:hash.:extension',
                             path: ':rails_root/public/system/:class/:attachment/:id_partition/:style/:hash.:extension',
                             hash_secret: 'fa06822165fcfcb16a25b300f7c76671520559e1a0759bb0f5e977416e571b3b5e937af6b144e0095fad23ddf95624c6aaffce375c7a1d8bf5a443bf9d94dd90',
                             :storage => :s3, :s3_credentials => "#{Rails.root}/config/s3.yml", :s3_host_name => "s3-ap-northeast-1.amazonaws.com", :s3_protocol => :https
  validates_attachment :resume, size: { in: 0..5.megabytes },
                                file_type_ignorance: true
  before_post_process :resize_images

  has_attached_file :photo,  url: '/system/:class/:attachment/:id_partition/:style/:hash.:extension',
                             path: ':rails_root/public/system/:class/:attachment/:id_partition/:style/:hash.:extension',
                             hash_secret: 'get_from_rake_secret',
                             :storage => :s3, :s3_credentials => "#{Rails.root}/config/s3.yml", :s3_host_name => "s3-ap-northeast-1.amazonaws.com"
  validates_attachment :photo, content_type: { content_type: /\Aimage\/.*\Z/ },
                                size: { in: 0..5.megabytes }

  has_many :experiences,  dependent: :destroy
  accepts_nested_attributes_for :experiences, allow_destroy: true, :reject_if => :all_blank

  has_many :educations, dependent: :destroy
  accepts_nested_attributes_for :educations, allow_destroy: true, :reject_if => :all_blank

  has_many :collections, dependent: :destroy
  accepts_nested_attributes_for :collections, allow_destroy: true, :reject_if => :all_blank

  has_many :skills, dependent: :destroy
  accepts_nested_attributes_for :skills, allow_destroy: true, :reject_if => :all_blank

  has_many :languages, dependent: :destroy
  accepts_nested_attributes_for :languages, allow_destroy: true, :reject_if => :all_blank

  has_many :user_company_follows, dependent: :destroy
  has_many :follow_companies, :through => :user_company_follows, :source => :company

  has_many :user_job_follows, dependent: :destroy
  has_many :follow_jobs, :through => :user_job_follows, :source => :job

  has_many :user_article_follows, dependent: :destroy
  has_many :follow_articles, :through => :user_article_follows, :source => :article

  has_many :articles

  has_many :user_job_applies
  has_many :job_applies, :through => :user_job_applies, :source => :job

  def image?
    resume_content_type =~ /\Aimage\/.*\Z/
  end

  def resize_images
    return false unless image?
  end

  def admin?
    self.role=="admin"
  end

  def is_follow_company?(company)
    self.follow_companies.include?(company)
  end

  def is_follow_job?(job)
    self.follow_jobs.include?(job)
  end

  def is_follow_article?(article)
    self.follow_articles.include?(article)
  end

  def check_admin
    unless current_user.role == "admin"
      raise ActiveRecord::RecordNotFound #導向404
      redirect_to root_path
    end
  end

  def self.get_fb_data(access_token)
    res = RestClient.get "https://graph.facebook.com/v2.4/me",  { :params => { :access_token => access_token, :fields=>["id", "name", "email", "picture"] } }
    if res.code == 200
      JSON.parse( res.to_str )
    else
      Rails.logger.warn(res.body)
      nil
    end
  end

  def self.from_omniauth(auth)
    # Case 1: Find existing user by facebook uid
    user = User.find_by_fb_uid( auth.uid )
    if user
      user.fb_image = auth.info.image
      user.fb_token = auth.credentials.token
      user.fb_raw_data = auth
      user.save!
      return user
    end

    # Case 2: Find existing user by email
    existing_user = User.find_by_email( auth.info.email )
    if existing_user
      existing_user.name = auth.info.name
      user.fb_image = auth.info.image
      existing_user.fb_uid = auth.uid
      existing_user.fb_token = auth.credentials.token
      existing_user.fb_raw_data = auth
      existing_user.save!
      return existing_user
    end

    # Case 3: Create new password
    user = User.new
    user.name = auth.info.name
    user.nickname = auth.info.nickname
    user.fb_image = auth.info.image
    user.fb_uid = auth.uid
    user.fb_token = auth.credentials.token
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.fb_raw_data = auth
    user.save!
    return user
  end

  private

  def generate_authentication_token
     self.authentication_token = Devise.friendly_token
  end

end
