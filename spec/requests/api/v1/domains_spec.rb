require "rails_helper"

RSpec.describe "Api::V1::Domains", type: :request do
  let!(:domain) { create(:domain, name: "Quran Studies") }

  describe "GET /api/v1/domains" do
    before { create_list(:concept, 4, domain: domain) }

    it "returns the list with concepts_count" do
      get "/api/v1/domains"
      expect(response).to have_http_status(:ok)
      attrs = json[:data].first[:attributes]
      expect(attrs[:slug]).to eq(domain.slug)
      expect(attrs[:concepts_count]).to eq(4)
    end
  end

  describe "GET /api/v1/domains/:slug" do
    it "returns the requested domain" do
      get "/api/v1/domains/#{domain.slug}"
      expect(response).to have_http_status(:ok)
      expect(json[:data][:attributes][:slug]).to eq(domain.slug)
      expect(json[:data][:attributes]).to have_key(:concepts_count)
    end

    it "returns 404 with a JSON:API error envelope for an unknown slug" do
      get "/api/v1/domains/does-not-exist"
      expect(response).to have_http_status(:not_found)
      expect(json[:errors].first[:status]).to eq("404")
    end
  end

  def json
    JSON.parse(response.body, symbolize_names: true)
  end
end
