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
    t.string   "banner_file_name",    limit: 255
    t.string   "banner_content_type", limit: 255
    t.integer  "banner_file_size",    limit: 4
    t.datetime "banner_updated_at"
    t.string   "banner_alt",          limit: 255
    t.string   "banner_url",          limit: 255
    t.string   "target",              limit: 255
    t.integer  "advert_id",           limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "advert_banners", ["advert_id"], name: "index_advert_banners_on_advert_id", using: :btree
  add_index "advert_banners", ["banner_content_type"], name: "index_advert_banners_on_banner_content_type", using: :btree
  add_index "advert_banners", ["banner_file_name"], name: "index_advert_banners_on_banner_file_name", using: :btree
  add_index "advert_banners", ["banner_file_size"], name: "index_advert_banners_on_banner_file_size", using: :btree
  add_index "advert_banners", ["banner_updated_at"], name: "index_advert_banners_on_banner_updated_at", using: :btree

  create_table "adverts", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "content",     limit: 255
    t.date     "date"
    t.integer  "views_count", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "areas", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.integer  "companies_count", limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "position",        limit: 4,   default: 0
  end

  create_table "article_categories", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.integer  "articles_count", limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "position",       limit: 4,   default: 0
  end

  create_table "article_companies", force: :cascade do |t|
    t.integer  "article_id", limit: 4
    t.integer  "company_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "article_company_taggings", force: :cascade do |t|
    t.integer  "article_id",     limit: 4
    t.integer  "company_tag_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "article_company_taggings", ["article_id"], name: "index_article_company_taggings_on_article_id", using: :btree
  add_index "article_company_taggings", ["company_tag_id"], name: "index_article_company_taggings_on_company_tag_id", using: :btree

  create_table "article_job_taggings", force: :cascade do |t|
    t.integer  "article_id", limit: 4
    t.integer  "job_tag_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "article_job_taggings", ["article_id"], name: "index_article_job_taggings_on_article_id", using: :btree
  add_index "article_job_taggings", ["job_tag_id"], name: "index_article_job_taggings_on_job_tag_id", using: :btree

  create_table "article_taggings", force: :cascade do |t|
    t.integer  "article_id",     limit: 4
    t.integer  "article_tag_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "article_taggings", ["article_id"], name: "index_article_taggings_on_article_id", using: :btree
  add_index "article_taggings", ["article_tag_id"], name: "index_article_taggings_on_article_tag_id", using: :btree

  create_table "article_tags", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.integer  "articles_count", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title",               limit: 255
    t.text     "content",             limit: 65535
    t.date     "published_on"
    t.string   "status",              limit: 255
    t.string   "banner_file_name",    limit: 255
    t.string   "banner_content_type", limit: 255
    t.integer  "banner_file_size",    limit: 4
    t.datetime "banner_updated_at"
    t.string   "banner_alt",          limit: 255
    t.integer  "article_category_id", limit: 4
    t.integer  "user_id",             limit: 4
    t.integer  "views_count",         limit: 4,     default: 0
    t.text     "description",         limit: 65535
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "articles", ["article_category_id"], name: "index_articles_on_article_category_id", using: :btree
  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "banners", force: :cascade do |t|
    t.string   "banner_file_name",    limit: 255
    t.string   "banner_content_type", limit: 255
    t.integer  "banner_file_size",    limit: 4
    t.datetime "banner_updated_at"
    t.string   "banner_alt",          limit: 255
    t.integer  "company_id",          limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "banners", ["banner_content_type"], name: "index_banners_on_banner_content_type", using: :btree
  add_index "banners", ["banner_file_name"], name: "index_banners_on_banner_file_name", using: :btree
  add_index "banners", ["banner_file_size"], name: "index_banners_on_banner_file_size", using: :btree
  add_index "banners", ["banner_updated_at"], name: "index_banners_on_banner_updated_at", using: :btree
  add_index "banners", ["company_id"], name: "index_banners_on_company_id", using: :btree

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "collections", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "url",        limit: 255
  end

  add_index "collections", ["user_id"], name: "index_collections_on_user_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "en_name",             limit: 255
    t.string   "brand",               limit: 255
    t.string   "phone",               limit: 255
    t.string   "email",               limit: 255
    t.string   "address",             limit: 255
    t.float    "latitude",            limit: 24
    t.float    "longitude",           limit: 24
    t.text     "about",               limit: 65535
    t.text     "idea",                limit: 65535
    t.text     "story",               limit: 65535
    t.text     "welfare",             limit: 65535
    t.string   "video",               limit: 255
    t.string   "interview",           limit: 255
    t.string   "web",                 limit: 255
    t.integer  "scale",               limit: 4
    t.integer  "capital",             limit: 4
    t.integer  "views_count",         limit: 4,     default: 0
    t.string   "logo_file_name",      limit: 255
    t.string   "logo_content_type",   limit: 255
    t.integer  "logo_file_size",      limit: 4
    t.datetime "logo_updated_at"
    t.string   "logo_alt",            limit: 255
    t.string   "ios",                 limit: 255
    t.string   "android",             limit: 255
    t.string   "fb",                  limit: 255
    t.integer  "company_category_id", limit: 4
    t.integer  "area_id",             limit: 4
    t.date     "published_on"
    t.integer  "sequence",            limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "companies", ["area_id"], name: "index_companies_on_area_id", using: :btree
  add_index "companies", ["company_category_id"], name: "index_companies_on_company_category_id", using: :btree

  create_table "company_categories", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.integer  "companies_count", limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "position",        limit: 4,   default: 0
  end

  create_table "company_forms", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "phone",      limit: 255
    t.string   "email",      limit: 255
    t.string   "category",   limit: 255
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "company_taggings", force: :cascade do |t|
    t.integer  "company_id",     limit: 4
    t.integer  "company_tag_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "company_taggings", ["company_id"], name: "index_company_taggings_on_company_id", using: :btree
  add_index "company_taggings", ["company_tag_id"], name: "index_company_taggings_on_company_tag_id", using: :btree

  create_table "company_tags", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.integer  "companies_count", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "educations", force: :cascade do |t|
    t.string   "school",     limit: 255
    t.string   "department", limit: 255
    t.text     "content",    limit: 65535
    t.date     "date_begin"
    t.date     "date_end"
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "educations", ["user_id"], name: "index_educations_on_user_id", using: :btree

  create_table "experiences", force: :cascade do |t|
    t.string   "company",    limit: 255
    t.string   "office",     limit: 255
    t.text     "content",    limit: 65535
    t.date     "date_begin"
    t.date     "date_end"
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "experiences", ["user_id"], name: "index_experiences_on_user_id", using: :btree

  create_table "galleries", force: :cascade do |t|
    t.string   "gallery_file_name",    limit: 255
    t.string   "gallery_content_type", limit: 255
    t.integer  "gallery_file_size",    limit: 4
    t.datetime "gallery_updated_at"
    t.string   "gallery_alt",          limit: 255
    t.integer  "company_id",           limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "galleries", ["company_id"], name: "index_galleries_on_company_id", using: :btree

  create_table "job_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "jobs_count", limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "position",   limit: 4,   default: 0
  end

  create_table "job_taggings", force: :cascade do |t|
    t.integer  "job_id",     limit: 4
    t.integer  "job_tag_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "job_taggings", ["job_id"], name: "index_job_taggings_on_job_id", using: :btree
  add_index "job_taggings", ["job_tag_id"], name: "index_job_taggings_on_job_tag_id", using: :btree

  create_table "job_tags", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "jobs_count", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "status",              limit: 255
    t.text     "content",             limit: 65535
    t.text     "skill",               limit: 65535
    t.date     "published_on"
    t.integer  "views_count",         limit: 4,     default: 0
    t.integer  "salary_ceiling",      limit: 4
    t.integer  "salary_floor",        limit: 4
    t.integer  "job_category_id",     limit: 4
    t.integer  "company_id",          limit: 4
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "year_salary_ceiling", limit: 4
    t.integer  "year_salary_floor",   limit: 4
    t.boolean  "intern",                            default: false
  end

  add_index "jobs", ["company_id"], name: "index_jobs_on_company_id", using: :btree
  add_index "jobs", ["job_category_id"], name: "index_jobs_on_job_category_id", using: :btree

  create_table "languages", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "content",    limit: 65535
    t.string   "degree",     limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "languages", ["user_id"], name: "index_languages_on_user_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "office",             limit: 255
    t.text     "about",              limit: 65535
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
    t.string   "photo_alt",          limit: 255
    t.integer  "company_id",         limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "content",    limit: 65535
    t.string   "degree",     limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "skills", ["user_id"], name: "index_skills_on_user_id", using: :btree

  create_table "socials", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "url",        limit: 255
    t.integer  "company_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "socials", ["company_id"], name: "index_socials_on_company_id", using: :btree

  create_table "user_article_follows", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "article_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "user_article_follows", ["article_id"], name: "index_user_article_follows_on_article_id", using: :btree
  add_index "user_article_follows", ["user_id"], name: "index_user_article_follows_on_user_id", using: :btree

  create_table "user_company_follows", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "company_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "user_company_follows", ["company_id"], name: "index_user_company_follows_on_company_id", using: :btree
  add_index "user_company_follows", ["user_id"], name: "index_user_company_follows_on_user_id", using: :btree

  create_table "user_job_applies", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "job_id",     limit: 4
    t.string   "token",      limit: 255
    t.datetime "sent_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "user_job_applies", ["job_id"], name: "index_user_job_applies_on_job_id", using: :btree
  add_index "user_job_applies", ["token"], name: "index_user_job_applies_on_token", using: :btree
  add_index "user_job_applies", ["user_id"], name: "index_user_job_applies_on_user_id", using: :btree

  create_table "user_job_follows", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "job_id",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "user_job_follows", ["job_id"], name: "index_user_job_follows_on_job_id", using: :btree
  add_index "user_job_follows", ["user_id"], name: "index_user_job_follows_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "role",                   limit: 255
    t.string   "name",                   limit: 255
    t.string   "nickname",               limit: 255
    t.string   "phone",                  limit: 255
    t.string   "address",                limit: 255
    t.string   "sex",                    limit: 255
    t.date     "birthday"
    t.string   "photo_file_name",        limit: 255
    t.string   "photo_content_type",     limit: 255
    t.integer  "photo_file_size",        limit: 4
    t.datetime "photo_updated_at"
    t.text     "summary",                limit: 65535
    t.string   "resume_file_name",       limit: 255
    t.string   "resume_content_type",    limit: 255
    t.integer  "resume_file_size",       limit: 4
    t.datetime "resume_updated_at"
    t.string   "authentication_token",   limit: 255
    t.string   "fb_uid",                 limit: 255
    t.string   "fb_token",               limit: 255
    t.text     "fb_raw_data",            limit: 65535
    t.string   "fb_image",               limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "socials", "companies"
end
