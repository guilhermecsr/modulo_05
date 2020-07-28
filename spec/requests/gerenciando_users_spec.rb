RSpec.describe 'Gerenciando Users', type: :request do
  describe 'requests' do
    describe '#index' do
      context 'user off' do
        before(:each) { get users_backoffice_welcome_index_path }
        it { expect(response).to redirect_to(new_user_session_path) }
        it { expect(response.code).to eq '302' }
      end

      context 'user on' do
        let!(:user) { FactoryBot.create :user }
        before do
          allow_any_instance_of(UsersBackofficeController).to receive(:authenticate_user!).and_return(true)
          allow_any_instance_of(UsersBackoffice::WelcomeController).to receive(:current_user).and_return(user)
          get users_backoffice_welcome_index_path
        end

        it { expect(response.code).to eq '200' }
      end
    end
  end
end