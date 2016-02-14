# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


CompanyCategory.create!(:name=>"新創")
ArticleCategory.create!(:name=>"新創")
JobCategory.create!(:name=>"新創")
Area.create!(:name=>"台北")

CompanyCategory.create!(:name=>"網路")
ArticleCategory.create!(:name=>"網路")
JobCategory.create!(:name=>"網路")
Area.create!(:name=>"台中")