class CreateAdverts < ActiveRecord::Migration
  def change
    create_table :adverts do |t|
      t.string     :name
      t.string     :content
      t.date       :date
      t.integer    :views_count
      t.timestamps null: false
    end
  end
end
