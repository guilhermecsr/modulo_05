FactoryBot.define do
  factory :user_profile do
    sequence(:adress) { |n| "adress #{n}" }
    sequence(:gender) { |n| "gender #{n}" }
    birthdate { (Time.now - 25.years).strftime("%m-%d-%Y") }
    user { create :user }
  end
end