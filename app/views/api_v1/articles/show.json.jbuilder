
json.articles do
  json.metadata do
    json.total Article.count
  end

  json.data do
    if @article.status.present?
    json.id @article.id
    end

    if @article.title.present?
    json.title @article.title
    end

    if @article.content.present?
    json.content strip_tags(@article.content)
    end

    if @article.published_on.present?
    json.published_on @article.published_on
    end

    if @article.status.present?
    json.status @article.status
    end

    if @article.banner.present?
    json.banner image_url(@article.banner)
    end

    if @article.views_count.present?
    json.views_count @article.views_count
    end

    if @article.article_category.present?
    json.category @article.article_category.name
    end


    if @article.job_tags.present?
    json.job_tags @article.job_tags do |t|
        json.name t.name
    end
    end

    if @article.users.present?
    json.follows_users @article.users do |u|
        json.name u.name
    end
    end

  end
end

