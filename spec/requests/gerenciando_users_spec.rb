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
          allow_any_instance_of(UsersBackofficeController)
              .to receive(:authenticate_user!).and_return(true)
          allow_any_instance_of(UsersBackoffice::WelcomeController)
              .to receive(:current_user).and_return(user)
          get users_backoffice_welcome_index_path
        end

        it { expect(response.code).to eq '200' }
      end
    end

    describe 'users#update' do
      let!(:user) { FactoryBot.create :user }
      let(:user_profile) { FactoryBot.create :user_profile, user_id: user.id }

      context 'params válidos' do
        let(:user_params) { { last_name: 'novo last' } }
        let(:params) do
          user_params.merge(user_profile_attributes: user_profile.attributes)
        end

        before(:each) do
          allow_any_instance_of(UsersBackofficeController)
              .to receive(:authenticate_user!).and_return(true)
          allow_any_instance_of(UsersBackofficeController)
              .to receive(:current_user).and_return(user)
          patch users_backoffice_profile_path(user.id),
                params: { id: user.id, user: params }
        end

        it { expect(response.code).to eq '302' }
        it { expect(User.last.last_name).to eq('novo last') }
        it { expect(response).to redirect_to users_backoffice_profile_path }
      end
    end
  end
end
