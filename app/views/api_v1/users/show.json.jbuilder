json.users do
  json.metadata do
    json.total User.count
  end

  json.data do
        if @user.id.present?
        json.id @user.id
        end

        if @user.name.present?
        json.name @user.name
        end

        if @user.phone.present?
        json.phone @user.phone
        end

        if @user.email.present?
        json.email @user.email
        end

        if @user.address.present?
        json.address @user.address
        end

        if @user.sex.present?
        json.sex @user.sex
        end

        if @user.birthday.present?
        json.birthday @user.birthday
        end

        if @user.photo.present?
        json.photo image_url(@user.photo)
        end

        if @user.fb_image.present?
        json.fb_image @user.fb_image
        end

        if @user.summary.present?
        json.summary @user.summary
        end

        if @user.languages.present?
        json.language @user.languages do |l|
            json.name l.name
            json.degree l.degree
        end
        end

        if @user.experiences.present?
        json.experiences @user.experiences do |e|
            json.company e.company
            json.office e.office
            json.content e.content
            json.data_begin e.date_begin
            json.date_end e.date_end
        end
        end


        if @user.educations.present?
        json.educations @user.educations do |e|
            json.school e.school
            json.department e.department
            json.data_begin e.date_begin
            json.date_end e.date_end
        end
        end


        if @user.collections.present?
        json.collections @user.collections do |c|
            json.content c.content
        end
        end

        if @user.skills.present?
        json.skills @user.skills do |s|
            json.name s.name
            json.content s.content
        end
        end

        if @user.resume.present?
        json.resume image_url(@user.resume)
        end

        if @user.follow_companies.present?
        json.follow_companies @user.follow_companies do |fc|
            json.id fc.id
            json.name fc.name
        end
        end

        if @user.follow_jobs.present?
        json.follow_jobs @user.follow_jobs do |fj|
            json.id fj.id
            json.name fj.name
        end
        end

        if @user.follow_articles.present?
        json.follow_articles @user.follow_articles do |fa|
            json.id fa.id
            json.title fa.title
        end
        end
  end
end

