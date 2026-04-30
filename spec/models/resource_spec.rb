require "rails_helper"

RSpec.describe Resource, type: :model do
  describe "factory" do
    it "is valid with default attributes" do
      expect(build(:resource)).to be_valid
    end
  end

  describe "associations" do
    it { is_expected.to belong_to(:concept) }
  end

  describe "validations" do
    subject { build(:resource) }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:link) }
    it { is_expected.to validate_presence_of(:resource_type) }
    it { is_expected.to validate_numericality_of(:position).only_integer }
  end

  describe "resource_type enum" do
    it "supports book, article, video, course, paper" do
      expect(Resource.resource_types.keys)
        .to match_array(%w[book article video course paper])
    end
  end
end
