def criando_base_para_testes
  let(:subject) { FactoryBot.create :subject }
  let(:question) { FactoryBot.create :question, subject_id: subject.id }
  let!(:answer) { FactoryBot.create :answer, question: question }
  let!(:user) { FactoryBot.create :user }
  let!(:admin) { FactoryBot.create :admin }
end

def logando_com_admin
  sleep 1
  fill_in('admin_email', with: admin.email)
  sleep 1
  fill_in('admin_password', with: admin.password)
  sleep 1
  click_button 'Log in'
  sleep 1
end

def logando_com_user
  sleep 1
  fill_in('user_email', with: user.email)
  sleep 1
  fill_in('user_password', with: user.password)
  sleep 1
  click_button 'Log in'
  sleep 1
end