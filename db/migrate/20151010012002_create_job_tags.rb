class CreateJobTags < ActiveRecord::Migration
  def change
    create_table :job_tags do |t|
      t.string  :name
      t.integer :jobs_count
      t.timestamps null: false
    end
  end
end
