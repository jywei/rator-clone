class CreateJobTaggings < ActiveRecord::Migration
  def change
    create_table :job_taggings do |t|
      t.integer :job_id, index: true
      t.integer :job_tag_id, index: true
      t.timestamps null: false
    end
  end
end
