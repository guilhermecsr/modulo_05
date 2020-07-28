RSpec.describe 'Gerenciando Site', type: :request do
  describe 'requests' do
    describe '#index' do
      before(:each) { get root_path }
      it { expect(response.code).to eq '200' }
      it { expect(response.body).to include 'Cadastrar-se' }
    end
  end
end