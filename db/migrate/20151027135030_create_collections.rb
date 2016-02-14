class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.text    :content
      t.integer :user_id, index: true
      t.timestamps null: false
    end
  end
end
