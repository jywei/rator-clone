json.yourator do

  json.metadata do
    json.total Company.count
  end

  json.data do

    if @company.id.present?
    json.id @company.id
    end

    if @company.brand.present?
    json.brand @company.brand
    end

    if @company.phone.present?
    json.phone @company.phone
    end

    if @company.email.present?
    json.email @company.email
    end

    if @company.area.present?
    json.area  @company.area.name
    end

    if @company.address.present?
    json.address @company.address
    end

    if @company.about.present?
    json.about @company.about
    end

    if @company.idea.present?
    json.idea @company.idea
    end

    if @company.story.present?
    json.story @company.story
    end

    if @company.welfare.present?
    json.welfare @company.welfare
    end

    if @company.video.present?
    json.video @company.video
    end

    if @company.interview.present?
    json.interview @company.interview
    end

    if @company.web.present?
    json.web @company.web
    end

    if @company.scale.present?
        json.scale @company.scale
    end

    if @company.capital.present?
        json.capital @company.capital
    end

    if @company.views_count.present?
    json.views_count @company.views_count
    end

    if @company.logo.present?
    json.logo image_url(@company.logo)
    end

    if @company.ios.present?
    json.ios @company.ios
    end

    if @company.android.present?
    json.android @company.android
    end

    if @company.fb.present?
    json.fb @company.fb
    end

    if @company.published_on.present?
    json.published_on @company.published_on
    end

    if @company.company_category.present?
    json.company_category @company.company_category.name
    end

    if @company.tags.present?
        json.company_tags @company.tags do |t|
             json.name  t.name
        end
    end

    if @company.jobs.present?
        json.company_jobs @company.jobs do |j|
            json.id j.id
            json.name j.name
            json.status j.status
            json.published_on j.published_on
        end
    end

    if @company.members.present?
        json.company_members @company.members do |m|
            json.name   m.name
            json.office m.office
            json.photo  image_url(m.photo)
        end
    end

    if @company.banners.present?
        json.banners @company.banners do |b|
            json.banner image_url(b.banner)
        end
    end

    if @company.galleries.present?
        json.galleries @company.galleries do |g|
            json.gallery image_url(g.gallery)
        end
    end

    if @company.users.present?
        json.follows_users @company.users do |u|
            json.id u.id
        end
    end

  end
end

