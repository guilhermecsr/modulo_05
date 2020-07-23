# RSpec.describe Welcome, type: :controller do
#   describe 'welcome#create' do
#     let(:user) { create :user }
#     context 'password is invalid' do
#       before(:each) do
#         post :create, params: { email: user.email, password: 'invalid' }
#       end
#       it { expect(response).to render_template(:new) }
#       it { expect(flash[:notice]).to eq(‘Email and password do not match’) }
#       end
#     end
#     context 'password is valid' do
#       before(:each) do
#         post :create, params: { email: user.email, password: user.password }
#       end
#       it { expect(response).to redirect_to '/dashboard' }
#       it { expect(controller.current_user).to eq(user) }
#     end
#   end
# end