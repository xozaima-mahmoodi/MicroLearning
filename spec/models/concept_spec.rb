require "rails_helper"

RSpec.describe Concept, type: :model do
  describe "factory" do
    it "is valid with default attributes" do
      expect(build(:concept)).to be_valid
    end
  end

  describe "associations" do
    it { is_expected.to belong_to(:domain) }
    it { is_expected.to have_many(:resources).dependent(:destroy) }

    it "has many prerequisites through prerequisite_links" do
      target = create(:concept)
      prereq = create(:concept)
      create(:concept_relation, source_concept: prereq, target_concept: target)
      expect(target.prerequisites).to contain_exactly(prereq)
    end

    it "has many next_steps through next_step_links" do
      source = create(:concept)
      nexty  = create(:concept)
      create(:concept_relation, source_concept: source, target_concept: nexty)
      expect(source.next_steps).to contain_exactly(nexty)
    end

    it "destroys prerequisite_links when the concept is destroyed" do
      target = create(:concept)
      prereq = create(:concept)
      relation = create(:concept_relation, source_concept: prereq, target_concept: target)
      target.destroy
      expect(ConceptRelation.where(id: relation.id)).to be_empty
    end
  end

  describe "validations" do
    subject { build(:concept) }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:difficulty_level) }
    it { is_expected.to validate_numericality_of(:position).only_integer }

    it "rejects a duplicate slug" do
      first = create(:concept, title: "Tawhid")
      dup   = build(:concept, title: "Tawhid 2")
      dup.slug = first.slug
      expect(dup).not_to be_valid
      expect(dup.errors[:slug]).to include("has already been taken")
    end
  end

  describe "difficulty_level enum" do
    it "exposes the four difficulty levels" do
      expect(Concept.difficulty_levels.keys)
        .to match_array(%w[beginner intermediate advanced expert])
    end
  end

  describe "prerequisite cycle detection" do
    let!(:a) { create(:concept) }
    let!(:b) { create(:concept) }
    let!(:c) { create(:concept) }

    it "rejects a direct self-loop (A -> A)" do
      relation = build(:concept_relation, source_concept: a, target_concept: a)
      expect(relation).not_to be_valid
      expect(relation.errors[:target_concept_id]).to include("cannot equal source_concept_id")
    end

    it "rejects a 2-node cycle (A -> B then B -> A)" do
      create(:concept_relation, source_concept: a, target_concept: b)
      relation = build(:concept_relation, source_concept: b, target_concept: a)
      expect(relation).not_to be_valid
      expect(relation.errors[:base].join).to match(/circular/)
    end

    it "rejects a 3-node cycle (A -> B -> C then C -> A)" do
      create(:concept_relation, source_concept: a, target_concept: b)
      create(:concept_relation, source_concept: b, target_concept: c)
      relation = build(:concept_relation, source_concept: c, target_concept: a)
      expect(relation).not_to be_valid
      expect(relation.errors[:base].join).to match(/circular/)
    end

    it "allows a non-cyclic chain (A -> B, A -> C)" do
      create(:concept_relation, source_concept: a, target_concept: b)
      relation = build(:concept_relation, source_concept: a, target_concept: c)
      expect(relation).to be_valid
    end
  end
end
