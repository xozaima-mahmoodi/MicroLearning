require "rails_helper"

RSpec.describe Category, type: :model do
  describe "factory" do
    it "is valid with default attributes" do
      expect(build(:category)).to be_valid
    end
  end

  describe "associations" do
    it { is_expected.to have_many(:domains).dependent(:nullify) }
  end

  describe "validations" do
    subject { build(:category) }

    it { is_expected.to validate_presence_of(:title) }

    it "auto-generates a slug from the title" do
      category = create(:category, title: "Hadith Sciences")
      expect(category.slug).to be_present
    end

    it "rejects a duplicate slug" do
      create(:category, title: "Hadith Sciences")
      dup = build(:category, title: "Hadith Sciences 2")
      dup.slug = "hadith-sciences"
      expect(dup).not_to be_valid
      expect(dup.errors[:slug]).to include("has already been taken")
    end

    it { is_expected.to validate_numericality_of(:position).only_integer }
  end

  describe ".ordered" do
    it "orders by position then id" do
      c2 = create(:category, position: 2)
      c1 = create(:category, position: 1)
      c3 = create(:category, position: 3)
      expect(Category.ordered).to eq([ c1, c2, c3 ])
    end
  end
end
