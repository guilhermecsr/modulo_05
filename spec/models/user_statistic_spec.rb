# frozen_string_literal: true

RSpec.describe UserStatistic, type: :model do
  describe 'associations' do
    let(:user_statistic) { FactoryBot.create :user_statistic }
    subject { user_statistic }
    it { is_expected.to belong_to(:user) }
  end

  describe 'methods' do
    let(:user) { FactoryBot.create :user }

    describe '#total_questions' do
      let(:user_statistic) { FactoryBot.create :user_statistic, user: user }
      let(:total) do
        user_statistic.right_questions + user_statistic.wrong_questions
      end

      it { expect(user_statistic.total_questions).to eq total }
    end
  end
end
