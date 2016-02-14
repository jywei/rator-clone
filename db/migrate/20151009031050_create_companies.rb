class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string     :name
      t.string     :en_name, :unique => true
      t.string     :brand
      t.string     :phone
      t.string     :email
      t.string     :address
      t.float      :latitude
      t.float      :longitude
      t.text       :about
      t.text       :idea
      t.text       :story
      t.text       :welfare
      t.string     :video
      t.string     :interview
      t.string     :web
      t.integer    :scale
      t.integer    :capital
      t.integer    :views_count, default: 0
      t.attachment :logo
      t.string     :logo_alt
      t.string     :ios
      t.string     :android
      t.string     :fb
      t.integer    :company_category_id, index: true
      t.integer    :area_id, index: true
      t.date       :published_on
      t.integer    :sequence
      t.timestamps null: false
    end
  end
end

