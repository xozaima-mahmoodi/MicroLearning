FactoryBot.define do
  factory :category do
    sequence(:title) { |n| "Category #{n}" }
    sequence(:position) { |n| n }
    color { "#ff0000" }
    icon  { "icon-category" }
  end
end
