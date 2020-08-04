# frozen_string_literal: true

FactoryBot.define do
  factory :question do
    sequence(:description) { |n| "Question #{n}" }
    association :subject
  end
end
