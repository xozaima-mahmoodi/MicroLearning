FactoryBot.define do
  factory :concept do
    association :domain
    sequence(:title) { |n| "Concept #{n}" }
    brief_summary    { "A short summary." }
    extended_content { "Long-form content for testing." }
    difficulty_level { :beginner }
    sequence(:position) { |n| n }
  end
end
