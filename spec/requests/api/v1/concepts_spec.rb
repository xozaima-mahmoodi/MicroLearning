require "rails_helper"

RSpec.describe "Api::V1::Concepts", type: :request do
  let!(:domain)  { create(:domain) }
  let!(:concept) { create(:concept, domain: domain, title: "Tawhid") }

  describe "GET /api/v1/concepts" do
    let!(:other) { create(:concept, domain: domain, title: "Risalah") }

    it "returns a flat search index when no domain_slug is given" do
      get "/api/v1/concepts"
      expect(response).to have_http_status(:ok)
      slugs = json[:data].map { |c| c[:attributes][:slug] }
      expect(slugs).to include(concept.slug, other.slug)
      expect(json[:data].first[:attributes].keys)
        .to include(:slug, :title, :domain_slug, :domain_name)
    end

    it "scopes to a domain when domain_slug is given" do
      another_domain = create(:domain)
      create(:concept, domain: another_domain)
      get "/api/v1/concepts", params: { domain_slug: domain.slug }
      expect(response).to have_http_status(:ok)
      slugs = json[:data].map { |c| c[:attributes][:slug] }
      expect(slugs).to contain_exactly(concept.slug, other.slug)
    end
  end

  describe "GET /api/v1/concepts/:slug" do
    it "returns the concept with prerequisites, next_steps and resources" do
      prereq = create(:concept, domain: domain)
      nexty  = create(:concept, domain: domain)
      create(:concept_relation, source_concept: prereq, target_concept: concept)
      create(:concept_relation, source_concept: concept, target_concept: nexty)
      create(:resource, concept: concept)

      get "/api/v1/concepts/#{concept.slug}"
      expect(response).to have_http_status(:ok)
      attrs = json[:data][:attributes]
      expect(attrs[:slug]).to eq(concept.slug)
      expect(attrs[:prerequisites].map { |p| p[:slug] }).to eq([ prereq.slug ])
      expect(attrs[:next_steps].map    { |n| n[:slug] }).to eq([ nexty.slug ])
      expect(attrs[:resources].size).to eq(1)
    end
  end

  describe "POST /api/v1/concepts/:slug/view" do
    it "increments views_count atomically" do
      expect {
        post "/api/v1/concepts/#{concept.slug}/view"
      }.to change { concept.reload.views_count }.by(1)
      expect(response).to have_http_status(:ok)
      expect(json[:data][:attributes][:views_count]).to eq(1)
    end
  end

  def json
    JSON.parse(response.body, symbolize_names: true)
  end
end
