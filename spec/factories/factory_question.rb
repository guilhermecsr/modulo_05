FactoryBot.define do
  factory :question do
    sequence(:description) { |n| "Question #{n}" }
    association :subject
  end
end
