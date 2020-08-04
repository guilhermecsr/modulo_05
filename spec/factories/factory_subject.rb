# frozen_string_literal: true

FactoryBot.define do
  factory :subject do
    sequence(:description) { |n| "Subject #{n}" }
  end
end
