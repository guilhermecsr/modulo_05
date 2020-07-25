FactoryBot.define do
  factory :answer do
    sequence(:description) { |n| "Answer #{n}" }
    association :question
    correct { false }
  end
end