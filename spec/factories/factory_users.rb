FactoryBot.define do
  factory :user do
    sequence(:first_name) { |n| "name #{n}" }
    sequence(:last_name) { |n| "last #{n}" }
    sequence(:email) { |n| "test#{n}@test.com" }
    encrypted_password { 'password' }
  end
end
