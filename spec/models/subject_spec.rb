# frozen_string_literal: true

RSpec.describe Subject, type: :model do
  describe 'associations' do
    let(:subject) { FactoryBot.create :subject }

    # subject { subject } >> nao foi utilizado pois da erro na palavra reservada "subject"
    it { expect(subject).to have_many(:questions) }
  end
end
