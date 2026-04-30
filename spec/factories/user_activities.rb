FactoryBot.define do
  factory :user_activity do
    association :concept
    sequence(:user_id) { |n| "device-#{n}" }
    activity_date { Date.current }
  end
end
