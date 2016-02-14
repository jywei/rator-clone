class CreateSocials < ActiveRecord::Migration
  def change
    create_table :socials do |t|
      t.string :title
      t.string :url
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
