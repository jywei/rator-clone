class AddYearSalaryToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :year_salary_ceiling, :integer
    add_column :jobs, :year_salary_floor, :integer
  end
end
