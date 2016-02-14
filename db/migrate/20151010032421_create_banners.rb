class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.attachment :banner, index: true
      t.string     :banner_alt
      t.integer    :company_id, index: true
      t.timestamps null: false
    end
  end
end
