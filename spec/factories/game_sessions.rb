FactoryBot.define do
  factory :game_session do
    total_weight { 0 }
    association :survey
  end
end
