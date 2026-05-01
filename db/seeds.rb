# Idempotent seed loader.
#
# Each category lives in its own module under db/seeds/categories/. The loop
# below upserts categories, domains and concepts, then wires up a prerequisite
# chain (each concept becomes the prereq of the next within its domain).
# Re-runs are safe; db:seed:replant truncates first if you want a clean slate.
#
# Translations: every Persian field is written under :fa via Mobility. If a
# bundle includes an `i18n: { en: { ... } }` block, those values are written
# under :en too. Bundles without an :en block fall back to :fa per the
# Mobility fallback chain configured in config/initializers/mobility.rb.

module SeedData; end

require_relative "seeds/categories/quranic_sciences"
require_relative "seeds/categories/hadith_sciences"
require_relative "seeds/categories/social_sciences"
require_relative "seeds/categories/humanities"
require_relative "seeds/categories/interdisciplinary"

CATEGORY_BUNDLES = [
  SeedData::QuranicSciences,
  SeedData::HadithSciences,
  SeedData::SocialSciences,
  SeedData::Humanities,
  SeedData::Interdisciplinary
].freeze

# Writes a translated attribute under :fa, then under :en if an English
# value is provided. The model is not saved here — callers persist once
# all attributes have been assigned across both locales.
def assign_translated!(record, attribute, fa_value, en_value)
  Mobility.with_locale(:fa) { record.public_send("#{attribute}=", fa_value) } if fa_value
  Mobility.with_locale(:en) { record.public_send("#{attribute}=", en_value) } if en_value
end

def upsert_category!(data)
  category = Category.find_or_initialize_by(slug: data[:slug])
  en = data.dig(:i18n, :en) || {}
  assign_translated!(category, :title, data[:title], en[:title])
  category.position = data[:position]
  category.color    = data[:color]
  category.icon     = data[:icon]
  category.save!
  category
end

def upsert_domain!(data, category)
  domain = Domain.find_or_initialize_by(slug: data[:slug])
  en = data.dig(:i18n, :en) || {}
  assign_translated!(domain, :name,        data[:name],        en[:name])
  assign_translated!(domain, :description, data[:description], en[:description])
  domain.position = data[:position]
  domain.color    = data[:color]
  domain.icon     = data[:icon]
  domain.category = category
  domain.save!
  domain
end

def upsert_concept!(data, domain, idx)
  concept = Concept.find_or_initialize_by(slug: data[:slug])
  en = data.dig(:i18n, :en) || {}
  assign_translated!(concept, :title,            data[:title],            en[:title])
  assign_translated!(concept, :brief_summary,    data[:brief_summary],    en[:brief_summary])
  assign_translated!(concept, :extended_content, data[:extended_content], en[:extended_content])
  concept.domain           = domain
  concept.difficulty_level = data[:difficulty_level]
  concept.position         = idx
  concept.save!
  concept
end

CATEGORY_BUNDLES.each do |bundle|
  category = upsert_category!(bundle::CATEGORY)

  bundle::DOMAINS.each do |d_data|
    domain = upsert_domain!(d_data, category)

    concepts = d_data[:concepts].each_with_index.map do |c_data, idx|
      upsert_concept!(c_data, domain, idx)
    end

    concepts.each_cons(2) do |prev_concept, next_concept|
      ConceptRelation.find_or_create_by!(
        source_concept: prev_concept,
        target_concept: next_concept
      )
    end
  end
end

# Sample resources on the first Psychology concept.
first_concept = Concept.friendly.find("zehn-agahi")
Resource.find_or_create_by!(
  concept: first_concept,
  title: "قدرت حال",
  author: "اکهارت تُله"
) do |r|
  r.link = "https://example.com/power-of-now"
  r.resource_type = :book
  r.position = 0
end

Resource.find_or_create_by!(
  concept: first_concept,
  title: "مقدمه‌ای بر ذهن‌آگاهی",
  author: "جان کابات-زین"
) do |r|
  r.link = "https://example.com/mindfulness-intro"
  r.resource_type = :article
  r.position = 1
end

puts "Seeded #{Category.count} categor(ies), #{Domain.count} domain(s), #{Concept.count} concept(s), #{ConceptRelation.count} relation(s), #{Resource.count} resource(s)."
