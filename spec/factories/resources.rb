FactoryBot.define do
  factory :resource do
    association :concept
    sequence(:title) { |n| "Resource #{n}" }
    author        { "Test Author" }
    sequence(:link) { |n| "https://example.com/resource-#{n}" }
    resource_type { :book }
    sequence(:position) { |n| n }
  end
end
