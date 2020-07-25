FactoryBot.define do
  factory :subject do
    sequence(:description) { |n| "Subject #{n}" }
  end
end
