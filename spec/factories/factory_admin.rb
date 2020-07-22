FactoryBot.define do
  factory :admin do
    sequence(:email) { |n| "test#{n}@admin.com" }
    password { '123456' }
    password_confirmation { '123456' }
  end
end
