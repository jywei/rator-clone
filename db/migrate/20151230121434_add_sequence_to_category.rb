class AddSequenceToCategory < ActiveRecord::Migration
  def change
    add_column :company_categories, :position, :integer, default: 0
    add_column :areas, :position, :integer, default: 0
    add_column :job_categories, :position, :integer, default: 0
    add_column :article_categories, :position, :integer, default: 0
  end
end
