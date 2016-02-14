class Experience < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :content, :company, :office, :date_begin, :date_end
end
