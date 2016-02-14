class AdvertBanner < ActiveRecord::Base
  belongs_to :advert
  has_attached_file :banner,  styles: { medium: '600x300>', thumb: '300x150>'},
                              url: '/system/:class/:attachment/:id_partition/:style/:hash.:extension',
                              path: ':rails_root/public/system/:class/:attachment/:id_partition/:style/:hash.:extension',
                              hash_secret: 'get_from_rake_secret',
                              :storage => :s3, :s3_credentials => "#{Rails.root}/config/s3.yml", :s3_host_name => "s3-ap-northeast-1.amazonaws.com", :s3_protocol => :https
  validates_attachment :banner, content_type: { content_type: /\Aimage\/.*\Z/ },
                                size: { in: 0..5.megabytes }
  validates_presence_of :banner
end
