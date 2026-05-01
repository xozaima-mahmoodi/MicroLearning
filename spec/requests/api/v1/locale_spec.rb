require "rails_helper"

RSpec.describe "API locale negotiation", type: :request do
  let!(:category) do
    cat = build(:category)
    Mobility.with_locale(:fa) { cat.title = "علوم قرآنی" }
    Mobility.with_locale(:en) { cat.title = "Quranic Sciences" }
    cat.save!
    cat
  end

  let!(:domain) do
    d = build(:domain, category: category)
    Mobility.with_locale(:fa) { d.name = "تفسیر";        d.description = "دانش بیان معانی آیات." }
    Mobility.with_locale(:en) { d.name = "Tafsir";        d.description = "The discipline of clarifying meanings." }
    d.save!
    d
  end

  let!(:concept) do
    c = build(:concept, domain: domain)
    Mobility.with_locale(:fa) do
      c.title            = "مبانی تفسیر"
      c.brief_summary    = "اصول بنیادین برای فهم آیات قرآن."
      c.extended_content = "متن بلندتر فارسی برای آزمون."
    end
    Mobility.with_locale(:en) do
      c.title            = "Foundations of Exegesis"
      c.brief_summary    = "The foundational principles for understanding the Quran."
      c.extended_content = "Longer English content for testing."
    end
    c.save!
    c
  end

  describe "default locale (no header)" do
    it "returns Persian title on /categories" do
      get "/api/v1/categories"
      expect(json[:data].first[:attributes][:title]).to eq("علوم قرآنی")
    end
  end

  describe "X-Locale: en" do
    it "returns the English title on /categories" do
      get "/api/v1/categories", headers: { "X-Locale" => "en" }
      expect(json[:data].first[:attributes][:title]).to eq("Quranic Sciences")
    end

    it "returns English on /domains and /concepts/:slug" do
      get "/api/v1/domains/#{domain.slug}", headers: { "X-Locale" => "en" }
      expect(json[:data][:attributes][:name]).to eq("Tafsir")

      get "/api/v1/concepts/#{concept.slug}", headers: { "X-Locale" => "en" }
      attrs = json[:data][:attributes]
      expect(attrs[:title]).to eq("Foundations of Exegesis")
      expect(attrs[:brief_summary]).to eq("The foundational principles for understanding the Quran.")
    end
  end

  describe "Accept-Language: en-US,en;q=0.9,fa;q=0.8" do
    it "honours the first matching tag" do
      get "/api/v1/categories", headers: { "Accept-Language" => "en-US,en;q=0.9,fa;q=0.8" }
      expect(json[:data].first[:attributes][:title]).to eq("Quranic Sciences")
    end
  end

  describe "fallback when an English translation is missing" do
    it "falls back to Persian for the requested attribute" do
      fa_only = build(:concept, domain: domain)
      Mobility.with_locale(:fa) { fa_only.title = "بدون ترجمه" }
      fa_only.save!

      get "/api/v1/concepts/#{fa_only.slug}", headers: { "X-Locale" => "en" }
      expect(json[:data][:attributes][:title]).to eq("بدون ترجمه")
    end
  end

  def json
    JSON.parse(response.body, symbolize_names: true)
  end
end
