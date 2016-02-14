class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string  :name
      t.string  :status
      t.text    :content
      t.text    :skill
      t.date    :published_on
      t.integer :views_count, default: 0
      t.integer :salary_ceiling
      t.integer :salary_floor
      t.integer :job_category_id, index: true
      t.integer :company_id, index: true
      t.timestamps null: false
    end
  end
end