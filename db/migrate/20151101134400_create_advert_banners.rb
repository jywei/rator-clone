class CreateAdvertBanners < ActiveRecord::Migration
  def change
    create_table :advert_banners do |t|
      t.attachment :banner, index: true
      t.string     :banner_alt
      t.string     :banner_url
      t.string     :target
      t.integer    :advert_id, index: true
      t.timestamps null: false
    end
  end
end
