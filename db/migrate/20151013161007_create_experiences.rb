class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string  :company
      t.string  :office
      t.text    :content
      t.date    :date_begin
      t.date    :date_end
      t.integer :user_id, index: true
      t.timestamps null: false
    end
  end
end
