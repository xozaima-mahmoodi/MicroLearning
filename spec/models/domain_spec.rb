require "rails_helper"

RSpec.describe Domain, type: :model do
  describe "factory" do
    it "is valid with default attributes" do
      expect(build(:domain)).to be_valid
    end
  end

  describe "associations" do
    it { is_expected.to belong_to(:category).optional }
    it { is_expected.to have_many(:concepts).dependent(:destroy) }
  end

  describe "validations" do
    subject { build(:domain) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_numericality_of(:position).only_integer }

    it "auto-generates a slug from the name" do
      domain = create(:domain, name: "Quran Studies")
      expect(domain.slug).to be_present
    end
  end

  describe "category relationship" do
    it "can have many domains under one category" do
      category = create(:category)
      d1 = create(:domain, category: category, position: 2)
      d2 = create(:domain, category: category, position: 1)
      expect(category.domains).to eq([ d2, d1 ])
    end

    it "nullifies category_id on its domains when the category is destroyed" do
      category = create(:category)
      domain   = create(:domain, category: category)
      category.destroy
      expect(domain.reload.category_id).to be_nil
    end
  end
end
