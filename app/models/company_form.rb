class CompanyForm < ActiveRecord::Base
  validates_presence_of :name, :phone, :email, :content, :category
end
