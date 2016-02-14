class Education < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :department, :school, :date_begin, :date_end
end
