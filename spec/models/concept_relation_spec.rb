require "rails_helper"

RSpec.describe ConceptRelation, type: :model do
  describe "factory" do
    it "is valid with default attributes" do
      expect(build(:concept_relation)).to be_valid
    end
  end

  describe "associations" do
    it { is_expected.to belong_to(:source_concept).class_name("Concept") }
    it { is_expected.to belong_to(:target_concept).class_name("Concept") }
  end

  describe "validations" do
    it "is invalid when source equals target" do
      concept = create(:concept)
      relation = build(:concept_relation, source_concept: concept, target_concept: concept)
      expect(relation).not_to be_valid
    end

    it "rejects a duplicate (source, target) pair" do
      a = create(:concept)
      b = create(:concept)
      create(:concept_relation, source_concept: a, target_concept: b)
      duplicate = build(:concept_relation, source_concept: a, target_concept: b)
      expect(duplicate).not_to be_valid
      expect(duplicate.errors[:source_concept_id]).to include("has already been taken")
    end
  end
end
