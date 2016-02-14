class Ckeditor::AttachmentFile < Ckeditor::Asset
  has_attached_file :data,
                    :url => "/ckeditor_assets/attachments/:id/:filename",
                    :path => ":rails_root/public/ckeditor_assets/attachments/:id/:filename",
                    :storage => :s3, :s3_credentials => "#{Rails.root}/config/s3.yml", :s3_host_name => "s3-ap-northeast-1.amazonaws.com"

  validates_attachment_presence :data
  validates_attachment_size :data, :less_than => 100.megabytes
  do_not_validate_attachment_file_type :data

  def url_thumb
    @url_thumb ||= Ckeditor::Utils.filethumb(filename)
  end
end
