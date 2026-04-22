FactoryBot.define do
  factory :concept do
    domain { nil }
    title { "MyString" }
    slug { "MyString" }
    brief_summary { "MyText" }
    extended_content { "MyText" }
    difficulty_level { 1 }
    position { 1 }
  end
end
