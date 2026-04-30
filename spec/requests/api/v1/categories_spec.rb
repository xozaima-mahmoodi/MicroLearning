require "rails_helper"

RSpec.describe "Api::V1::Categories", type: :request do
  describe "GET /api/v1/categories" do
    let!(:cat1) { create(:category, title: "Aqidah", position: 1) }
    let!(:cat2) { create(:category, title: "Fiqh",   position: 2) }
    let!(:domain1) { create(:domain, category: cat1, name: "Tawhid") }
    let!(:domain2) { create(:domain, category: cat1, name: "Iman") }
    let!(:domain3) { create(:domain, category: cat2, name: "Salah") }

    before do
      create_list(:concept, 2, domain: domain1)
      create_list(:concept, 1, domain: domain2)
      create_list(:concept, 3, domain: domain3)
    end

    it "returns 200 OK" do
      get "/api/v1/categories"
      expect(response).to have_http_status(:ok)
    end

    it "returns categories ordered by position" do
      get "/api/v1/categories"
      slugs = json[:data].map { |c| c[:attributes][:slug] }
      expect(slugs).to eq([ cat1.slug, cat2.slug ])
    end

    it "exposes the JSON:API envelope" do
      get "/api/v1/categories"
      first = json[:data].first
      expect(first.keys).to include(:id, :type, :attributes)
      expect(first[:type]).to eq("category")
    end

    it "includes the per-category concepts_count" do
      get "/api/v1/categories"
      first  = json[:data].find { |c| c[:attributes][:slug] == cat1.slug }
      second = json[:data].find { |c| c[:attributes][:slug] == cat2.slug }
      expect(first[:attributes][:concepts_count]).to eq(3)   # domain1: 2 + domain2: 1
      expect(second[:attributes][:concepts_count]).to eq(3)  # domain3: 3
    end

    it "includes per-domain concepts_count inside the embedded domains array" do
      get "/api/v1/categories"
      first   = json[:data].find { |c| c[:attributes][:slug] == cat1.slug }
      domains = first[:attributes][:domains]
      tawhid  = domains.find { |d| d[:slug] == domain1.slug }
      iman    = domains.find { |d| d[:slug] == domain2.slug }
      expect(tawhid[:concepts_count]).to eq(2)
      expect(iman[:concepts_count]).to eq(1)
    end
  end

  def json
    JSON.parse(response.body, symbolize_names: true)
  end
end
