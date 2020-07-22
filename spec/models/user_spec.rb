RSpec.describe User, type: :model do
  describe 'associations' do
  let(:user) { FactoryBot.create :user }
  subject { user }
  # it { is_expected.to have_one(:user_profile) }
  end

  describe 'validations' do
    let(:user) { FactoryBot.create :user }
    subject { user }
    before(:each) do
      allow_any_instance_of(User)
          .to receive(:reset_password_token_present?).and_return(true)
    end

    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to be_valid }
  end
end
