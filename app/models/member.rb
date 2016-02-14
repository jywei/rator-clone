class Member < ActiveRecord::Base
  validates_presence_of :name, :office, :about, :photo
  belongs_to :company

  has_attached_file :photo,  styles: { thumb: '130x130>' },
                             url: '/system/:class/:attachment/:id_partition/:style/:hash.:extension',
                             path: ':rails_root/public/system/:class/:attachment/:id_partition/:style/:hash.:extension',
                             hash_secret: 'get_from_rake_secret',
                             :storage => :s3, :s3_credentials => "#{Rails.root}/config/s3.yml", :s3_host_name => "s3-ap-northeast-1.amazonaws.com", :s3_protocol => :https
  validates_attachment :photo, content_type: { content_type: /\Aimage\/.*\Z/ },
                                size: { in: 0..5.megabytes }
end
