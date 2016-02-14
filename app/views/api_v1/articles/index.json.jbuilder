
json.articles do
  json.metadata do
    json.total Article.count
  end

  json.data @articles do |a|
    if a.id.present?
    json.id a.id
    end

    if a.banner.present?
    json.banner image_url(a.banner)
    end

    if a.title.present?
    json.title a.title
    end

    if a.published_on.present?
    json.published_on a.published_on
    end

    if a.status.present?
    json.status a.status
    end

    if a.views_count.present?
    json.views_count a.views_count
    end

    if a.description.present?
    json.description a.description
    end

    if a.article_category.present?
    json.category a.article_category.name
    end

    if a.article_tags.present?
    json.article_tags a.article_tags do |t|
        json.name t.name
    end
    end
  end
end

