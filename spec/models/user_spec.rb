RSpec.describe User, type: :model do
  describe 'associations' do
  let(:user) { FactoryBot.create :user }
  subject { user }

  it { is_expected.to have_one(:user_profile) }
  end

  describe 'validations' do
    let(:user) { FactoryBot.create :user }
    subject { user }
    before(:each) do
      allow_any_instance_of(User)
          .to receive(:reset_password_token_present?).and_return(true)
    end

    # it { is_expected.to validate_presence_of(:first_name) } # apenas em update
    it { is_expected.to be_valid }
  end

  describe 'methods' do
    let!(:user) { FactoryBot.create :user }

    context 'nome_correto' do
      it 'user_full_name' do
        expect(user.full_name).to eq "#{user.first_name} #{user.last_name}"
      end
    end

    context 'nome_incorreto' do
      it 'user_full_name' do
        expect(user.full_name).to_not eq "#{user.first_name}#{user.last_name}"
      end
    end
  end
end
