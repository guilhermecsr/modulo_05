RSpec.describe UserProfile, type: :model do
  describe 'associations' do
    let(:user_profile) { FactoryBot.create :user_profile }
    subject { user_profile }
    it { is_expected.to belong_to(:user) }
  end
end