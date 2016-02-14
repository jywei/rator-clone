class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string  :name
      t.text    :content
      t.string  :degree
      t.integer :user_id, index: true
      t.timestamps null: false
    end
  end
end
