
json.jobs do
  json.metadata do
    json.total Job.count
  end

  json.data @jobs do |j|
  if j.status == "career_begin"
    if j.id.present?
    json.id j.id
    end

    if j.name.present?
    json.name j.name
    end

    if j.company.banners.present?
    json.banner image_url(j.company.banners.first.banner)
    end

    if j.status.present?
    json.status j.status
    end

    if j.published_on.present?
    json.published_on j.published_on
    end

    if j.views_count.present?
    json.views_count j.views_count
    end

    if j.salary_ceiling.present?
    json.salary_ceiling j.salary_ceiling
    end

    if j.salary_floor.present?
    json.salary_floor j.salary_floor
    end

    if j.tags.present?
    json.tags j.tags do |t|
        json.name t.name
    end
    end

    if j.job_category.present?
    json.job_category j.job_category.name
    end
  end
  end
end

