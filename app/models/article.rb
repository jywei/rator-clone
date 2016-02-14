class Article < ActiveRecord::Base

  STATUS = ["published", "draft"]
  validates_inclusion_of :status, :in => STATUS

  validates_presence_of :title, :published_on, :status, :banner, :description
  belongs_to :article_category, :counter_cache => true
  belongs_to :user

  has_attached_file :banner,  styles: { art: '198x112>', medium: '495x281>', thumb: '275x156>' },
                              url: '/system/:class/:attachment/:id_partition/:style/:hash.:extension',
                              path: ':rails_root/public/system/:class/:attachment/:id_partition/:style/:hash.:extension',
                              hash_secret: 'get_from_rake_secret',
                              :storage => :s3, :s3_credentials => "#{Rails.root}/config/s3.yml", :s3_host_name => "s3-ap-northeast-1.amazonaws.com", :s3_protocol => :https
  validates_attachment :banner, content_type: { content_type: /\Aimage\/.*\Z/ },
                                size: { in: 0..5.megabytes }
  has_many :article_taggings
  has_many :article_tags, :through => :article_taggings

  has_many :user_article_follows, dependent: :destroy
  has_many :users, :through => :user_article_follows, :source => :user

  has_many :article_companies
  has_many :companies, :through => :article_companies

  def company_list
    self.companies.map{ |t| t.brand }
  end

  def company_list=(str)
    self.companies = str.map do |t|
      tag = Company.find_by_brand(t)
    end.compact
  end

  def article_tag_list
    self.article_tags.map{ |t| t.name }.join(",")
  end

  def article_tag_list=(str)
    arr = str.split(",")

    self.article_tags = arr.map do |t|
      tag = ArticleTag.find_by_name(t)
      unless tag
        tag = ArticleTag.create!( :name => t )
      end
        tag
    end

  end

end
