class Advert < ActiveRecord::Base

has_many :advert_banners, dependent: :destroy
accepts_nested_attributes_for :advert_banners, allow_destroy: true, :reject_if => :all_blank

end
