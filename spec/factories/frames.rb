FactoryBot.define do
  factory :frame do
    title { 'Test frame' }
    sequence(:code) { |n| "test_frame#{n}" }
    association :survey
  end
end
