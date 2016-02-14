
json.jobs do

  json.metadata do
    json.total Job.count
  end

  json.data do
    if @job.id.present?
    json.id @job.id
    end

    if @job.name.present?
    json.name @job.name
    end

    if @job.tj.company.present?
    json.company_name @job.company.name
    end

    if @job.company.logo.present?
    json.company_logo image_url(@job.company.logo)
    end


    if @job.content.present?
    json.content @job.content
    end

    if @job.skill.present?
    json.skill @job.skill
    end

    if @job.salary_ceiling.present?
    json.salary_ceiling @job.salary_ceiling
    end

    if @job.salary_floor.present?
    json.salary_floor @job.salary_floor
    end

    if @job.company.welfare.present?
    json.company_welfare @job.company.welfare
    end

    if @job.published_on.present?
    json.published_on @job.published_on
    end

    if @job.views_count.present?
    json.views_count @job.views_count
    end

    if @job.tags.present?
        json.tags @job.tags do |t|
            json.name t.name
        end
    end


    if @job.users.present?
        json.follows_users @job.users do |u|
            json.id u.id
        end
    end

  end
 end

