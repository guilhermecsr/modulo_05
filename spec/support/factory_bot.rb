# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.start
  # FactoryBot.lint # strategy: :build, traits: true
  ensure
    DatabaseCleaner.clean
  end
end
