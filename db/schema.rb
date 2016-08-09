# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151231022054) do

  create_table "advert_banners", force: :cascade do |t|
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
    t.string   "banner_alt"
    t.string   "banner_url"
    t.string   "target"
    t.integer  "advert_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "advert_banners", ["advert_id"], name: "index_advert_banners_on_advert_id"
  add_index "advert_banners", ["banner_content_type"], name: "index_advert_banners_on_banner_content_type"
  add_index "advert_banners", ["banner_file_name"], name: "index_advert_banners_on_banner_file_name"
  add_index "advert_banners", ["banner_file_size"], name: "index_advert_banners_on_banner_file_size"
  add_index "advert_banners", ["banner_updated_at"], name: "index_advert_banners_on_banner_updated_at"

  create_table "adverts", force: :cascade do |t|
    t.string   "name"
    t.string   "content"
    t.date     "date"
    t.integer  "views_count"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.integer  "companies_count"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "position",        default: 0
  end

  create_table "article_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "articles_count"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "position",       default: 0
  end

  create_table "article_companies", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "article_company_taggings", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "company_tag_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "article_company_taggings", ["article_id"], name: "index_article_company_taggings_on_article_id"
  add_index "article_company_taggings", ["company_tag_id"], name: "index_article_company_taggings_on_company_tag_id"

  create_table "article_job_taggings", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "job_tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "article_job_taggings", ["article_id"], name: "index_article_job_taggings_on_article_id"
  add_index "article_job_taggings", ["job_tag_id"], name: "index_article_job_taggings_on_job_tag_id"

  create_table "article_taggings", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "article_tag_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "article_taggings", ["article_id"], name: "index_article_taggings_on_article_id"
  add_index "article_taggings", ["article_tag_id"], name: "index_article_taggings_on_article_tag_id"

  create_table "article_tags", force: :cascade do |t|
    t.string   "name"
    t.integer  "articles_count"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.date     "published_on"
    t.string   "status"
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
    t.string   "banner_alt"
    t.integer  "article_category_id"
    t.integer  "user_id"
    t.integer  "views_count",         default: 0
    t.text     "description"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "articles", ["article_category_id"], name: "index_articles_on_article_category_id"
  add_index "articles", ["user_id"], name: "index_articles_on_user_id"

  create_table "banners", force: :cascade do |t|
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
    t.string   "banner_alt"
    t.integer  "company_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "banners", ["banner_content_type"], name: "index_banners_on_banner_content_type"
  add_index "banners", ["banner_file_name"], name: "index_banners_on_banner_file_name"
  add_index "banners", ["banner_file_size"], name: "index_banners_on_banner_file_size"
  add_index "banners", ["banner_updated_at"], name: "index_banners_on_banner_updated_at"
  add_index "banners", ["company_id"], name: "index_banners_on_company_id"

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "collections", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "url"
  end

  add_index "collections", ["user_id"], name: "index_collections_on_user_id"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "en_name"
    t.string   "brand"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "about"
    t.text     "idea"
    t.text     "story"
    t.text     "welfare"
    t.string   "video"
    t.string   "interview"
    t.string   "web"
    t.integer  "scale"
    t.integer  "capital"
    t.integer  "views_count",         default: 0
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "logo_alt"
    t.string   "ios"
    t.string   "android"
    t.string   "fb"
    t.integer  "company_category_id"
    t.integer  "area_id"
    t.date     "published_on"
    t.integer  "sequence"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "companies", ["area_id"], name: "index_companies_on_area_id"
  add_index "companies", ["company_category_id"], name: "index_companies_on_company_category_id"

  create_table "company_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "companies_count"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "position",        default: 0
  end

  create_table "company_forms", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "category"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_taggings", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "company_tag_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "company_taggings", ["company_id"], name: "index_company_taggings_on_company_id"
  add_index "company_taggings", ["company_tag_id"], name: "index_company_taggings_on_company_tag_id"

  create_table "company_tags", force: :cascade do |t|
    t.string   "name"
    t.integer  "companies_count"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "educations", force: :cascade do |t|
    t.string   "school"
    t.string   "department"
    t.text     "content"
    t.date     "date_begin"
    t.date     "date_end"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "educations", ["user_id"], name: "index_educations_on_user_id"

  create_table "experiences", force: :cascade do |t|
    t.string   "company"
    t.string   "office"
    t.text     "content"
    t.date     "date_begin"
    t.date     "date_end"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "experiences", ["user_id"], name: "index_experiences_on_user_id"

  create_table "galleries", force: :cascade do |t|
    t.string   "gallery_file_name"
    t.string   "gallery_content_type"
    t.integer  "gallery_file_size"
    t.datetime "gallery_updated_at"
    t.string   "gallery_alt"
    t.integer  "company_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "galleries", ["company_id"], name: "index_galleries_on_company_id"

  create_table "job_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "jobs_count"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "position",   default: 0
  end

  create_table "job_taggings", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "job_tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "job_taggings", ["job_id"], name: "index_job_taggings_on_job_id"
  add_index "job_taggings", ["job_tag_id"], name: "index_job_taggings_on_job_tag_id"

  create_table "job_tags", force: :cascade do |t|
    t.string   "name"
    t.integer  "jobs_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "name"
    t.string   "status"
    t.text     "content"
    t.text     "skill"
    t.date     "published_on"
    t.integer  "views_count",         default: 0
    t.integer  "salary_ceiling"
    t.integer  "salary_floor"
    t.integer  "job_category_id"
    t.integer  "company_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "year_salary_ceiling"
    t.integer  "year_salary_floor"
    t.boolean  "intern",              default: false
  end

  add_index "jobs", ["company_id"], name: "index_jobs_on_company_id"
  add_index "jobs", ["job_category_id"], name: "index_jobs_on_job_category_id"

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.string   "degree"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "languages", ["user_id"], name: "index_languages_on_user_id"

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.string   "office"
    t.text     "about"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "photo_alt"
    t.integer  "company_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.string   "degree"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "skills", ["user_id"], name: "index_skills_on_user_id"

  create_table "socials", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "socials", ["company_id"], name: "index_socials_on_company_id"

  create_table "user_article_follows", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_article_follows", ["article_id"], name: "index_user_article_follows_on_article_id"
  add_index "user_article_follows", ["user_id"], name: "index_user_article_follows_on_user_id"

  create_table "user_company_follows", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_company_follows", ["company_id"], name: "index_user_company_follows_on_company_id"
  add_index "user_company_follows", ["user_id"], name: "index_user_company_follows_on_user_id"

  create_table "user_job_applies", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.string   "token"
    t.datetime "sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_job_applies", ["job_id"], name: "index_user_job_applies_on_job_id"
  add_index "user_job_applies", ["token"], name: "index_user_job_applies_on_token"
  add_index "user_job_applies", ["user_id"], name: "index_user_job_applies_on_user_id"

  create_table "user_job_follows", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_job_follows", ["job_id"], name: "index_user_job_follows_on_job_id"
  add_index "user_job_follows", ["user_id"], name: "index_user_job_follows_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "role"
    t.string   "name"
    t.string   "nickname"
    t.string   "phone"
    t.string   "address"
    t.string   "sex"
    t.date     "birthday"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.text     "summary"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
    t.string   "authentication_token"
    t.string   "fb_uid"
    t.string   "fb_token"
    t.text     "fb_raw_data"
    t.string   "fb_image"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
