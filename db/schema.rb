# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2026_04_30_071200) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.string "slug", null: false
    t.integer "position", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color"
    t.string "icon"
    t.index ["position"], name: "index_categories_on_position"
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "concept_relations", force: :cascade do |t|
    t.bigint "source_concept_id", null: false
    t.bigint "target_concept_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_concept_id", "target_concept_id"], name: "idx_concept_relations_unique_pair", unique: true
    t.index ["source_concept_id"], name: "index_concept_relations_on_source_concept_id"
    t.index ["target_concept_id"], name: "index_concept_relations_on_target_concept_id"
    t.check_constraint "source_concept_id <> target_concept_id", name: "no_self_loop"
  end

  create_table "concepts", force: :cascade do |t|
    t.bigint "domain_id", null: false
    t.string "title"
    t.string "slug", null: false
    t.text "brief_summary"
    t.text "extended_content"
    t.integer "difficulty_level", default: 0, null: false
    t.integer "position", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "views_count", default: 0, null: false
    t.index ["domain_id", "difficulty_level"], name: "index_concepts_on_domain_id_and_difficulty_level"
    t.index ["domain_id", "position"], name: "index_concepts_on_domain_id_and_position"
    t.index ["domain_id"], name: "index_concepts_on_domain_id"
    t.index ["slug"], name: "index_concepts_on_slug", unique: true
    t.index ["views_count"], name: "index_concepts_on_views_count"
  end

  create_table "domains", force: :cascade do |t|
    t.string "name"
    t.string "slug", null: false
    t.text "description"
    t.integer "position", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color"
    t.string "icon"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_domains_on_category_id"
    t.index ["position"], name: "index_domains_on_position"
    t.index ["slug"], name: "index_domains_on_slug", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "mobility_string_translations", force: :cascade do |t|
    t.string "locale", null: false
    t.string "key", null: false
    t.string "value"
    t.string "translatable_type"
    t.bigint "translatable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["translatable_id", "translatable_type", "key"], name: "index_mobility_string_translations_on_translatable_attribute"
    t.index ["translatable_id", "translatable_type", "locale", "key"], name: "index_mobility_string_translations_on_keys", unique: true
    t.index ["translatable_type", "key", "value", "locale"], name: "index_mobility_string_translations_on_query_keys"
  end

  create_table "mobility_text_translations", force: :cascade do |t|
    t.string "locale", null: false
    t.string "key", null: false
    t.text "value"
    t.string "translatable_type"
    t.bigint "translatable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["translatable_id", "translatable_type", "key"], name: "index_mobility_text_translations_on_translatable_attribute"
    t.index ["translatable_id", "translatable_type", "locale", "key"], name: "index_mobility_text_translations_on_keys", unique: true
  end

  create_table "resources", force: :cascade do |t|
    t.bigint "concept_id", null: false
    t.string "title", null: false
    t.string "author"
    t.string "link", null: false
    t.integer "resource_type", default: 0, null: false
    t.integer "position", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["concept_id", "position"], name: "index_resources_on_concept_id_and_position"
    t.index ["concept_id"], name: "index_resources_on_concept_id"
  end

  create_table "user_activities", force: :cascade do |t|
    t.string "user_id", null: false
    t.bigint "concept_id", null: false
    t.date "activity_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["concept_id"], name: "index_user_activities_on_concept_id"
    t.index ["user_id", "activity_date"], name: "index_user_activities_on_user_id_and_activity_date"
    t.index ["user_id", "concept_id", "activity_date"], name: "idx_user_activities_uniq", unique: true
  end

  add_foreign_key "concept_relations", "concepts", column: "source_concept_id"
  add_foreign_key "concept_relations", "concepts", column: "target_concept_id"
  add_foreign_key "concepts", "domains"
  add_foreign_key "domains", "categories"
  add_foreign_key "resources", "concepts"
  add_foreign_key "user_activities", "concepts"
end
