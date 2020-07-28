RSpec.describe 'Gerenciando Site', type: :request do
  describe 'requests' do
    describe '#index' do
      context 'user off' do
        before(:each) { get root_path }
        it { expect(response.code).to eq '200' }
        it do
          expect(response.body).to include 'Cadastrar-se',
                                           'Time to Answer',
                                           'Últimas questões cadastradas...',
                                           'para continuar respondendo!'
        end
      end

      context 'user on' do
        let!(:user) { FactoryBot.create :user }
        before do
          allow_any_instance_of(UsersBackofficeController).to receive(:authenticate_user!).and_return(true)
          allow_any_instance_of(Site::WelcomeController).to receive(:current_user).and_return(user)
          get root_path
        end

        it { expect(response.code).to eq '200' }
        it { expect(response.body).not_to include 'Cadastrar-se' }
        it do
          expect(response.body).to include 'Backoffice',
                                           'Time to Answer',
                                           'Últimas questões cadastradas...'
        end
      end
    end
  end
end