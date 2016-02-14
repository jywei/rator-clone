class Skill < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :content, :name
end
