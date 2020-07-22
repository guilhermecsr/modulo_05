RSpec.describe Admin, type: :model do
  describe 'associations' do
    let(:admin) { create :admin }
    subject { admin }
  end

  describe 'validations' do
    let(:admin) { FactoryBot.create :admin }
    subject { admin }
    before(:each) do
      allow_any_instance_of(Admin)
          .to receive(:reset_password_token_present?).and_return(true)
    end
  end
end