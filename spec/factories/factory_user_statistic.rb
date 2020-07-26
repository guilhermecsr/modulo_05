FactoryBot.define do
  factory :user_statistic do
    right_questions { rand(1..20) }
    wrong_questions { rand(1..20) }
    user { create :user }
  end
end