namespace :dev do


  task :rebuild =>["db:drop", "db:reset", :faker]

  task :faker => :environment do
    Company.delete_all
    Job.delete_all
    Article.delete_all

    puts "產生假資料"

    5.times do |i|
      e = Company.create!(:name => Faker::Company.name,
                         :en_name=>Faker::Lorem.word ,
                         :brand=> Faker::Company.name ,
                         :area_id=>Faker::Number.between(1, 2),
                         :company_category_id=>Faker::Number.between(1, 2),
                         :address=>Faker::Address.street_address,
                         :phone=>Faker::Company.duns_number,
                         :logo=>Faker::Company.logo,
                         :published_on=>Faker::Date.forward(23),
                         :email=>Faker::Internet.email,
                         :about=>Faker::Lorem.paragraph(10)
                         )
         e.banners.create(:banner=>"https://d2v9k5u4v94ulw.cloudfront.net/small_light(dw=940,dh=420,da=s,ds=s,cw=940,ch=420,cc=FFFFFF)/assets/images/211530/original/d4b59672-59bf-4568-85b4-70f03e467086.png?1446002224")

      2.times do|j|
        e.jobs.create!(:name => Faker::App.name,
                      :status=>"career_begin",
                      :content=>Faker::Lorem.sentences,
                      :skill=>Faker::Lorem.sentences,
                      :published_on=>Faker::Date.forward(23),
                      :salary_ceiling=>Faker::Number.number(5),
                      :salary_floor=>Faker::Number.number(5),
                      :job_category_id=>Faker::Number.between(1, 2)
                      )
      end
    end

    5.times do |i|
      Article.create!(:title=>Faker::Company.name,
                     :content=>Faker::Lorem.paragraph(10),
                     :status=>"published",
                     :article_category_id=>Faker::Number.between(1, 2),
                     :user_id=>1,
                     :published_on=>Faker::Date.forward(23),
                     :description=>Faker::Lorem.paragraph(5),
                     :banner=>"https://d2v9k5u4v94ulw.cloudfront.net/small_light(dw=940,dh=420,da=s,ds=s,cw=940,ch=420,cc=FFFFFF)/assets/images/211530/original/d4b59672-59bf-4568-85b4-70f03e467086.png?1446002224"
                     )
    end
    puts "bye"

  end
end