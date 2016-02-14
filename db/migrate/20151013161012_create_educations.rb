class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string  :school
      t.string  :department
      t.text    :content
      t.date    :date_begin
      t.date    :date_end
      t.integer :user_id, index: true
      t.timestamps null: false
    end
  end
end
