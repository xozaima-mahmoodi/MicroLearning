FactoryBot.define do
  factory :domain do
    sequence(:name) { |n| "Domain #{n}" }
    description { "A test domain" }
    sequence(:position) { |n| n }
    color { "#00ff00" }
    icon  { "icon-domain" }
    association :category
  end
end
