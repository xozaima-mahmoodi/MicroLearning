require "rails_helper"

RSpec.describe UserActivity, type: :model do
  describe "factory" do
    it "is valid with default attributes" do
      expect(build(:user_activity)).to be_valid
    end
  end

  describe "associations" do
    it { is_expected.to belong_to(:concept) }
  end

  describe "validations" do
    subject { build(:user_activity) }

    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:activity_date) }

    it "rejects a duplicate (user_id, concept_id, activity_date) tuple" do
      first = create(:user_activity)
      duplicate = build(:user_activity,
                        user_id: first.user_id,
                        concept: first.concept,
                        activity_date: first.activity_date)
      expect(duplicate).not_to be_valid
    end
  end

  describe "scopes" do
    it ".for_user filters by user_id" do
      mine = create(:user_activity, user_id: "device-mine")
      _theirs = create(:user_activity, user_id: "device-theirs")
      expect(UserActivity.for_user("device-mine")).to contain_exactly(mine)
    end

    it ".between filters by activity_date range" do
      old = create(:user_activity, activity_date: Date.current - 10)
      mid = create(:user_activity, activity_date: Date.current - 3)
      new_one = create(:user_activity, activity_date: Date.current)
      result = UserActivity.between(Date.current - 5, Date.current)
      expect(result).to contain_exactly(mid, new_one)
      expect(result).not_to include(old)
    end
  end
end
