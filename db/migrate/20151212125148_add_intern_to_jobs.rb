class AddInternToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :intern, :boolean, default: 0
  end
end
