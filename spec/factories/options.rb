FactoryBot.define do
  factory :option do
    text { 'Test option' }
    sequence(:code) { |n| "test_option#{n}" }
    association :frame
  end
end
