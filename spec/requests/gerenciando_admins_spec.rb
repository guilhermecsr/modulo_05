# frozen_string_literal: true

RSpec.describe 'Gerenciando Admins', type: :request do
  describe 'requests' do
    describe '#index' do
      context 'user off' do
        before(:each) { get admins_backoffice_welcome_index_path }
        it { expect(response).to redirect_to(new_admin_session_path) }
        it { expect(response.code).to eq '302' }
      end

      context 'admin on' do
        let!(:admin) { FactoryBot.create :admin }
        let!(:user) { FactoryBot.create :user }
        let!(:question) { FactoryBot.create :question }
        before do
          allow_any_instance_of(AdminsBackofficeController)
            .to receive(:authenticate_admin!).and_return(true)
          allow_any_instance_of(AdminsBackoffice::WelcomeController)
            .to receive(:current_admin).and_return(admin)
          get admins_backoffice_welcome_index_path
        end

        it { expect(response.code).to eq '200' }
      end
    end
  end
end
