class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string     :name
      t.string     :office
      t.text       :about
      t.attachment :photo
      t.string     :photo_alt
      t.integer    :company_id
      t.timestamps null: false
    end
  end
end
