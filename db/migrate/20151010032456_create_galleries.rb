class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.attachment :gallery
      t.string     :gallery_alt
      t.integer    :company_id, index: true
      t.timestamps null: false
    end
  end
end
