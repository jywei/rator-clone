class Company < ActiveRecord::Base
  validates_presence_of :name, :en_name, :brand, :email, :address, :published_on

  has_many :company_taggings
  has_many :tags, :through => :company_taggings, :source => :company_tag
  has_many :jobs, dependent: :destroy

  has_attached_file :logo,  styles: { thumb: '100x100>' },
                            url: '/system/:class/:attachment/:id_partition/:style/:hash.:extension',
                            path: ':rails_root/public/system/:class/:attachment/:id_partition/:style/:hash.:extension',
                            hash_secret: 'get_from_rake_secret',
                            :storage => :s3, :s3_credentials => "#{Rails.root}/config/s3.yml", :s3_host_name => "s3-ap-northeast-1.amazonaws.com", :s3_protocol => :https
  validates_attachment :logo, content_type: { content_type: /\Aimage\/.*\Z/ },
                                size: { in: 0..5.megabytes }


  has_many :banners, dependent: :destroy
  accepts_nested_attributes_for :banners, allow_destroy: true, :reject_if => :all_blank

  has_many :galleries, dependent: :destroy
  accepts_nested_attributes_for :galleries, allow_destroy: true, :reject_if => :all_blank

  has_many :socials, dependent: :destroy
  accepts_nested_attributes_for :socials, allow_destroy: true, :reject_if => :all_blank

  belongs_to :company_category, :counter_cache => true
  belongs_to :area, :counter_cache => true

  has_many :members, dependent: :destroy

  has_many :user_company_follows, dependent: :destroy
  has_many :users, :through => :user_company_follows, :source => :user

  geocoded_by :address               # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  def to_param
    self.en_name
  end

  def company_tag_list
    self.tags.map{ |t| t.name }.join(",")
  end

  def company_tag_list=(str)
    arr = str.split(",")

    self.tags = arr.map do |t|
      tag = CompanyTag.find_by_name(t)
      unless tag
        tag = CompanyTag.create!( :name => t )
      end
        tag
    end

  end
end
