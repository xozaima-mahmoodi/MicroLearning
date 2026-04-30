require "rails_helper"

RSpec.describe "Api::V1::Activities", type: :request do
  let(:device_id) { "device-abc-123" }
  let(:headers)   { { "X-Device-Id" => device_id } }
  let!(:concept)  { create(:concept) }

  describe "GET /api/v1/activities" do
    it "returns 400 without an X-Device-Id header" do
      get "/api/v1/activities"
      expect(response).to have_http_status(:bad_request)
      expect(json[:errors].first[:title]).to match(/X-Device-Id/)
    end

    it "returns the activity summary for the requesting device" do
      create(:user_activity, user_id: device_id, concept: concept, activity_date: Date.current)
      create(:user_activity, user_id: device_id, concept: concept, activity_date: Date.current - 1)

      get "/api/v1/activities", headers: headers
      expect(response).to have_http_status(:ok)
      expect(json[:range]).to include(:from, :to)
      expect(json[:days].size).to eq(2)
      expect(json[:total_concepts]).to eq(1)
      expect(json[:current_streak]).to eq(2)
      expect(json[:longest_streak]).to eq(2)
    end

    it "isolates activity by device" do
      create(:user_activity, user_id: device_id,        concept: concept)
      create(:user_activity, user_id: "other-device",   concept: concept)
      get "/api/v1/activities", headers: headers
      expect(json[:total_concepts]).to eq(1)
      expect(json[:days].size).to eq(1)
    end
  end

  describe "POST /api/v1/activities" do
    it "creates a UserActivity for today and is idempotent on the same day" do
      expect {
        post "/api/v1/activities", params: { concept_slug: concept.slug }, headers: headers
      }.to change(UserActivity, :count).by(1)
      expect(response).to have_http_status(:created)
      expect(json[:ok]).to eq(true)
      expect(json[:date]).to eq(Date.current.iso8601)

      expect {
        post "/api/v1/activities", params: { concept_slug: concept.slug }, headers: headers
      }.not_to change(UserActivity, :count)
    end

    it "returns 400 without an X-Device-Id header" do
      post "/api/v1/activities", params: { concept_slug: concept.slug }
      expect(response).to have_http_status(:bad_request)
    end

    it "returns 404 for an unknown concept_slug" do
      post "/api/v1/activities", params: { concept_slug: "does-not-exist" }, headers: headers
      expect(response).to have_http_status(:not_found)
    end
  end

  def json
    JSON.parse(response.body, symbolize_names: true)
  end
end
