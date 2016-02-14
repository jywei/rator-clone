
json.yourator do
  json.metadata do
    json.total Company.count
  end

  json.data @companies do |c|
    if c.id.present?
    json.id c.id
    end

    if c.brand.present?
    json.brand c.brand
    end

    if c.logo.present?
    json.logo image_url(c.logo)
    end

    if c.about.present?
    json.about c.about
    end

    if c.company_category.present?
    json.company_category c.company_category.name
    end

    if c.tags.present?
      json.company_tags c.tags do |t|
           json.name  t.name
      end
    end

  end
end

