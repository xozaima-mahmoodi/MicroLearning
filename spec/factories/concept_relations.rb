FactoryBot.define do
  factory :concept_relation do
    association :source_concept, factory: :concept
    association :target_concept, factory: :concept
  end
end
